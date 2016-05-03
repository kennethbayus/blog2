class UsersController < ApplicationController

  def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])

	 	if @user.update(user_params)
  		flash['success'] = "User was updated successfully"
  		redirect_to root_path
  	else
  		render :edit
  	end

	end

	private
		def user_params
			params.require(:user).permit(:username, :printname, :password, :photo)
		end

end
