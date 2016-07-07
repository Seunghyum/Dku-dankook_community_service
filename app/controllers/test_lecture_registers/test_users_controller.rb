class TestLectureRegisters::TestUsersController < TestLectureRegisters::ApplicationController

  #auth
  load_and_authorize_resource

  def sign_in
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
    @test_user = TestUser.new(test_user_params)

    respond_to do |format|
      if @test_user.save
        format.html { redirect_to rehearsals_path }
      else
        format.html { render :new }
      end
    end
  end

  private
    def test_user_params
      params.require(:test_user).permit(:username, :pwd)
    end
end
