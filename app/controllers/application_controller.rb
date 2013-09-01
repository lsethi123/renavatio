class ApplicationController < ActionController::Base
  protect_from_forgery

	before_filter :authorize
	helper_method :logged_in?
	def authorize
		unless Staff.find_by_id(session[:employee_id])
			redirect_to login_url, notice: "Please log in"
		end
	end

	def logged_in?
		!session[:employee_id].blank?
	end

	def current_user_id
		session[:employee_id]
	end

	def current_user_name
		session[:name]
	end

end
