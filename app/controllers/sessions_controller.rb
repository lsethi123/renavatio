class SessionsController < ApplicationController
	skip_before_filter :authorize

	# def create
	# 	user = Staff.find_by_email(params[:email])
	# 		set_session(user)
	# 		redirect_to patients_path
	# 	else
	# 		redirect_to login_url, alert: "Invalid user/password combination"
	# 	end
 #  end

 #  def set_session(user)
 #  	session[:user_id] = user.id
 #  	session[:name] = "#{user.firstname} #{user.lastname}"
 #  end

 #  def destroy
	# 	session[:user_id] = nil
	# 	session[:name] = nil
	# 	redirect_to login_url, notice: "Logged Out"
 #  end

  def new
  end

  def create
		user = Staff.find_by_email(params[:email])
		if user and user.password == params[:password]
			session[:employee_id] = user.id
			session[:name] = "#{user.firstname} #{user.lastname}"
			redirect_to patients_url
		else
			redirect_to login_url, alert: "Invalid user/password combination"
		end
  end

  def destroy
		session[:employee_id] = nil
		redirect_to login_url, notice: "Logged Out"
  end

end
