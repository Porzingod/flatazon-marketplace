class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    session[:user_id] ||= nil
  end

  def welcome
    if session[:user_id]
      redirect_to '/dashboard'
    end
  end
end
