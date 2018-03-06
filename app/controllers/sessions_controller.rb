class SessionsController < ApplicationController

  def new
    if session[:user_id]
      redirect_to '/dashboard'
    end
  end

  def create
    if params[:password] || params[:password] != ""
      @user = User.find_by(username: params[:username])
      if @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to "/dashboard"
      else
        render :new
      end
    else
      render :new
    end
  end

  def destroy
    if params
      session.delete(:user_id)
      redirect_to '/'
    else
      redirect_to '/'
    end
  end
end
