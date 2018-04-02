class SessionsController < ApplicationController
  # def new
  # end

  # def create
  # 	@user = User.find_by(username: params[:username]).try(:authenticate, params[:password])

  # 	return render action: 'new' unless @user

  # 	session[:user_id] = @user.id
  # 	redirect_to posts_path
  # end

  # def destroy
  # 	session[:user_id] = nil
  # 	redirect_to root_path
  # end
  def new
  end

  def show
  	redirect_to '/'
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      log_in user
      redirect_to posts_path
    else
      flash.now[:notice] = 'Invalid username/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to '/'
  end
end
