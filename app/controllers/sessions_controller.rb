class SessionsController < ApplicationController
  def welcome
    if session[:user_id]
      redirect_to '/dashboard'
    end
  end

  def create
    if params[:password] || params[:password] != ""
      @user = User.find_by(username: params[:username])
      if @user.present?
        if @user.authenticate(params[:password])
          session[:user_id] = @user.id
          redirect_to "/dashboard"
        else
          redirect_to root
        end
      else
        redirect_to root
      end
    else
      redirect_to root
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
