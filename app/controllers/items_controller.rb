class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.search(params[:term])
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
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
    params.require(:item).permit(:name, :price, :quantity, :term)
  end
end
