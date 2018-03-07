class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    set_item
  end

  def new
  end

  def create
  end

  def edit
    set_item
  end

  def update
    set_item
  end

  def destroy
  #
  end

  def add_to_cart
    set_item
    if session[:user_id]
      if @item.user.id != session[:user_id]
        @user = User.find(session[:user_id])
        @item = Item.find(params[:id])
        Cart.create(user: @user, item: @item)
        redirect_to '/cart'
      else
        render :show
      end
    else
      render :show
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
  end
end
