class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :user_has_profile?

  helper_method :current_user

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  private

  def authenticate_user!
    redirect_to login_path, notice: 'Usted tiene que estar conectado.' unless current_user
  end

  def user_has_profile?
    if current_user && current_user.profile.nil?
      redirect_to new_profile_path, notice: 'Cuéntanos más sobre ti'
    end
  end

end
