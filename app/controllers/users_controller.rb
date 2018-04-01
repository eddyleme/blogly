class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
		@user = User.new user_params
		# if @user.save
		# 	redirect_to root_path, notice: 'User was successfully created.'
  #   else
  #   	render :new
  #   end
		return render action: 'new' unless @user.save
			# redirect_to root_path
			session[:user_id] = @user.id
			redirect_to posts_path, notice: 'User was successfully created.'
	end

	private
	def user_params
		params.require(:user).permit(:username, :password, :password_confirmation, :email)
	end
end
