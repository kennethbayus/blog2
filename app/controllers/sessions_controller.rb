class SessionsController <ApplicationController

	def new
	end

	def create

		user = User.where(username: params[:username]).first

		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			flash['success'] = 'Logged in successfully'
			redirect_to root_path
		else
			flash['danger'] = 'There was an error logging in, please try again'
			redirect_to login_path
		end


	end

	def destroy
		session[:user_id] = nil
		flash['success'] = 'Logged out successfully'
		redirect_to root_path
	end

end
