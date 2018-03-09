class CartsController < ApplicationController
  def cart
    @user = User.find(session[:user_id])
    @cart = @user.cart
  end

  def show
  end

  def checkout
    @user = User.find(session[:user_id])
    @user.cart
    if @user.balance >= @user.cart_total.to_f
      order_date = Time.now.strftime("%m/%d/%Y -- %I:%M:%S%p")
      @user.cart.each do |cart|
        buyer_balance = @user.balance.to_f
        citem = cart.item
        seller_balance = citem.user.balance
        item_qty_remaining = citem.quantity
        item_price = citem.price
        citem.update(quantity: (item_qty_remaining - 1))
        @user.update(balance: (buyer_balance - item_price))
        citem.user.update(balance: (seller_balance + item_price))
        Order.create(user: @user, item_name: citem.name, item_price: citem.price, item_quantity: 1, order_date: order_date)
        if citem.quantity == 0
          citem.delete
        end
        cart.delete
      end
      redirect_to '/dashboard', :notice => 'Cart successfully checked out'
    else
      redirect_to '/cart', :notice => 'You do not have enough balance to check out'
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.delete
    redirect_to '/cart', :notice => 'Item was successfully removed'
  end

  def empty
    @user = User.find(session[:user_id])
    @cart = @user.cart
    if @cart[0].present?
      @cart.each {|cart| cart.delete}
      redirect_to '/items/all'
    else
      redirect_to '/cart'
    end
  end
end
