class MeetingsController < ApplicationController
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  # GET /meetings
  # GET /meetings.json
  def index
    @meetings = Meeting.all
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
  end

  # GET /meetings/new
  def new
    @meeting = Meeting.new
  end

  # GET /meetings/1/edit
  def edit
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting = Meeting.new(meeting_params)
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
        format.html { redirect_to @meeting, notice: 'Meeting was successfully created.' }
        format.json { render :show, status: :created, location: @meeting }
      else
        format.html { render :new }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /meetings/1
  # PATCH/PUT /meetings/1.json
  def update
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
        format.json { render :show, status: :ok, location: @meeting }
      else
        format.html { render :edit }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url, notice: 'Meeting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def meeting_params
      params.require(:meeting).permit(:name, :start_time, :content, :display_tag, :photo, :end_time, :event_type, :type_class)
    end
end
