class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!, :except => [:index, :sign_in]

  # add strong param to devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  #권한 설정
  skip_authorization_check :if => :devise_controller?

  check_authorization :if => :admin_subdomain?, :only => [:update, :create, :destroy, :edit, :new]   # check_authorization :only => [:update, :destroy, :edit, :new]
  #권한 없이 접근 시 에러미시지
  rescue_from CanCan::AccessDenied do |exception|
       redirect_to root_url, :alert => exception.message
  end

  private

    def admin_subdomain?
      request.subdomain == "admin"
    end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_in) {|u| u.permit(:login, :username, :email, :password, :remember_me)}
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :remember_me, :student_number, :profile, :gender, :username, :major) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :student_number, :profile, :username) }
    end
end
