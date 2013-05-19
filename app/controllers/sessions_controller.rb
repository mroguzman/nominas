# encoding: UTF-8

class SessionsController < ApplicationController
  skip_before_filter :authorize

  def login
  end

  def new
    redirect_to_new_company_or_dashboard if current_user
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to_new_company_or_dashboard
    else
      redirect_to root_url, alert: "Usuario o contraseña inválidos"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Sesión terminada"
  end

  private

  def redirect_to_new_company_or_dashboard
    if current_user.company
      redirect_to dashboard_index_url
    else
      redirect_to new_company_url, notice: "Crea tu empresa"
    end
  end
end
