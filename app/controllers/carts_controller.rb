class CartsController < ApplicationController
  def show
    @cart = User.find(session[:user_id]).cart
  end
end
