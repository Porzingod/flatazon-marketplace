class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)

    if @item.save
      redirect_to category_item_path(@item.category, @item)
    else
      render :new
    end
  end

  def edit
    if @item.update(item_params)

  end

  def update
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
    params.require(:item).permit(:price, :user, :name, :quantity, :category_id, :avatar)
  end
end
