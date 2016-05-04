class UsersController < ApplicationController

  def edit
		@user = User.find_by slug: params[:id]
	end

	def update
		@user = User.find_by slug: params[:id]

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
