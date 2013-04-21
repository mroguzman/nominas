# encoding: UTF-8

class SessionsController < ApplicationController
  skip_before_filter :authorize

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to payrolls_url
    else
      redirect_to root_url, alert: "Usuario o password inválidos"
    end
  end

  def destroy
  end
end