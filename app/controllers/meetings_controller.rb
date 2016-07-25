class MeetingsController < ApplicationController

  #auth
  load_and_authorize_resource

  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  def index
    @meetings = Meeting.all
  end

  def show
    unless @meeting.start_time == @meeting.end_time
      @event_time = Time.at(@meeting.start_time).strftime("%Y년 %m월 %d일") + " ~ " + Time.at(@meeting.end_time).strftime("%Y년 %m월 %d일")
    else
      @event_time = Time.at(@meeting.start_time).strftime("%Y년 %m월 %d일")
    end
  end

  def new
    @meeting = Meeting.new
  end

  def edit
  end

  def create
    @meeting = Meeting.new(meeting_params)
    uploader = ImageUploader.new
    uploader.store!(params[:meeting][:photo])
    @meeting.save

    event_type_check = @meeting.event_type
    if event_type_check == "학사"
      @meeting.update(type_class: "primary")
    elsif event_type_check == "동아리"
      @meeting.update(type_class: "success")
    elsif event_type_check == "총학"
      @meeting.update(type_class: "info")
    elsif event_type_check == "강연"
      @meeting.update(type_class: "warning")
    elsif event_type_check == "기타"
      @meeting.update(type_class: "danger")
    end

    t = @meeting.end_time - @meeting.start_time

    date_inerval = Time.at(t).strftime("%d").to_i

    if date_inerval > 0
      (date_inerval - 1).times do |x|
          Meeting.create(
                        name: @meeting.name,
                        start_time: @meeting.start_time + (x + 1).day,
                        content: @meeting.content,
                        photo: @meeting.photo,
                        display_tag: @meeting.display_tag,
                        end_time: @meeting.end_time + (x + 1).day,
                        event_type: @meeting.event_type,
                        type_class: @meeting.type_class
          )
      end
    end

    respond_to do |format|
      if @meeting
        format.html { redirect_to @meeting }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to @meeting }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url}
    end
  end

  private
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    def meeting_params
      params.require(:meeting).permit(:name, :start_time, :content, :display_tag, :photo, :end_time, :event_type, :type_class)
    end
end
