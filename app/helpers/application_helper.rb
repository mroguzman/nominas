module ApplicationHelper
	def current_user
    User.find_by_id(session[:user_id])
  end

  def active_if_controller(controller)
  	"active" if params[:controller] == controller.to_s 
  end
end
