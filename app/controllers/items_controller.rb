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
  end

  def add_to_cart(item_id)
    if session[:user_id]
      User.find(session[:user_id]).cart << Item.find(item_id)
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
