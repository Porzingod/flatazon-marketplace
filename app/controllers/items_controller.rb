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

  def add_to_cart
    if session[:user_id]
      @user = User.find(session[:user_id])
      @item = Item.find(params[:id])
      @user.add_to_cart(@item)
      @user.save
      byebug
      redirect_to '/cart'
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
