class CartsController < ApplicationController
  def index
    @user = User.find(session[:user_id])
    @cart = @user.cart
  end

  def checkout
    @user = User.find(session[:user_id])
    @user.cart
    if @user.balance >= @user.cart_total.to_f
      buyer_balance = @user.balance.to_f
      order_date = Time.now
      @user.cart.each do |cart|
        citem = cart.item
        seller_balance = citem.user.balance
        item_qty_remaining = citem.quantity
        item_price = citem.price
        citem.update(quantity: (item_qty_remaining - 1))
        @user.update(balance: (buyer_balance - item_price))
        citem.user.update(balance: (seller_balance + item_price))
        Order.create(user: @user, item: citem, order_date: order_date)
        if citem.quantity == 0
          citem.delete
        end
        cart.delete
      end
      redirect_to '/cart'
    else
      redirect_to '/cart'
    end
  end
end
