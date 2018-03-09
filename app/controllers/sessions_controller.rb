class SessionsController < ApplicationController
  layout false

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
          redirect_to root_url
        end
      else
        redirect_to root_url
      end
    else
      redirect_to root_url
    end
  end

  def destroy
    if params
      session.delete(:user_id)
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

end
