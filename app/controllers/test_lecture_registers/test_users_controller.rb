class TestLectureRegisters::TestUsersController < TestLectureRegisters::ApplicationController

  #auth
  # load_and_authorize_resource param_method: :test_user_params

  def sign_in
  end

  def remote_ip
    # 개발환경에서만 적용
    if request.remote_ip == '::1'
      # Hard coded remote address
      '123.45.67.89'
    else
      request.remote_ip
    end
  end

  def sign_up
    @test_user = TestUser.new
  end

  def user_check
    if TestUser.find_by(:username).pwd == params[:pwd]
      redirect_to rehearsals_path
    end
    redirect_to test_sign_in_rehearsals_path
  end

  def create
    user_ip = UserIp.where(user_ip: remote_ip).take

    if user_ip.nil?
      @test_user = TestUser.new(address: remote_ip)
    else
      @test_user = TestUser.new(user_ip: remote_ip)
    end
    respond_to do |format|
      if @test_user.save
        format.html{ redirect_to test_lectures_path }
      else
        format.html{ redirect_to :back }
      end
    end
  end

  private
    def test_user_params
      params.require(:test_user).permit(:username, :pwd)
    end
end
