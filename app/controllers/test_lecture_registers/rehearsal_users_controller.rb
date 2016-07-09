class TestLectureRegisters::RehearsalUsersController < TestLectureRegisters::ApplicationController
  include RehearsalsHelper

  # before_action :set_rehearsal_user, only: :sign_in

  #auth
  # load_and_authorize_resource

  def sign_in
    user_ip = RehearsalUser.where(user_ip: remote_ip).take

    if user_ip.nil?
      @rehearsal_user = RehearsalUser.create(user_ip: remote_ip)
    else
      @rehearsal_user = user_ip
    end
  end

  # private
  #   def set_rehearsal_user
  #     @rehearsal_user = RehearsalUser.find(params[:id])
  #   end
end
