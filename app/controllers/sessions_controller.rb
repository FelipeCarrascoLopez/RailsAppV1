class SessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[login create]
  skip_before_action :user_has_profile?

  def login

  end

  def create
    @user = User.find_by(email: params[:session][:email])

    if @user.present? && @user.authenticate(params[:session][:password])
      if @user.is_confirmed?
        session[:user_id] = @user.id
        redirect_to root_path, notice: "Iniciaste sesion"
      else
        redirect_to login_path, notice: "Tienes que confirmar tu cuenta."
      end
    else
      redirect_to login_path, notice: "Correo electrónico o contraseña incorrectos"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path, notice: "Cerraste Sesion"
  end
end
