  class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :authorize
  
  protected
  
  def authorize
    unless current_user
      redirect_to root_url
    end
  end
  
  def current_user
    User.find_by_id(session[:user_id])
  end
end