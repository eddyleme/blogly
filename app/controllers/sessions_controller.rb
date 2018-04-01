class SessionsController < ApplicationController
  def new
  	if session[:user_id]
  		redirect_to posts_path
  	end
  end

  def create
  	@user = User.find_by(username: params[:username]).try(:authenticate, params[:password])

  	return render action: 'new' unless @user

  	session[:user_id] = @user.id
  	redirect_to posts_path
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path
  end

end
