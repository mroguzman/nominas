class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authorize

  layout :select_layout

  protected

  def authorize
    unless current_user
      redirect_to root_url
    end
  end

  def current_user
    User.find_by_id(session[:user_id])
  end

  def current_company
    current_user.company
  end

  private

  def select_layout
    if current_user
      "application"
    else
      "no_session"
    end
  end
end
