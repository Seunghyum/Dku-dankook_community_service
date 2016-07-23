class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!, :except => [:index, :sign_in]

  # add strong param to devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  # 개발 모드일 때 config 리로드
  before_filter :reload_rails_admin, if: :rails_admin_path?

  #권한 설정
  skip_authorization_check :if => :devise_controller?

  check_authorization :if => :admin_subdomain?, :only => [:update, :create, :destroy, :edit, :new]   # check_authorization :only => [:update, :destroy, :edit, :new]

  private

    def admin_subdomain?
      request.subdomain == "admin"
    end

    def reload_rails_admin
      #  models = %W(all_models)
      # models = ActiveRecord::Base.send :subclasses

      models = ActiveRecord::Base.descendants
      models.each do |m|
       RailsAdmin::Config.reset_model(m)
      end
      RailsAdmin::Config::Actions.reset

      load("#{Rails.root}/config/initializers/rails_admin.rb")
    end

    def rails_admin_path?
     controller_path =~ /rails_admin/ && Rails.env.development?
    end
  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_in) {|u| u.permit(:login, :username, :email, :password, :remember_me)}
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :remember_me, :profile, :gender, :username) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :student_number, :profile, :username) }
    end
end
