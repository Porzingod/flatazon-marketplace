class CartsController < ApplicationController
  def show
    @user = User.find(session[:user_id])
    @cart = @user.cart
  end
end
