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
    byebug
    @item = Item.new(item_params)
    @item.update(user_id: session[:user_id])
    if @item.save
      redirect_to category_item_path(@item.category, @item)
    else
      render :new, :notice => 'there was an error'
    end
  end

  def edit
  end

  def update
    if @item.user.id == session[:user_id]
      if @item.update(item_params)
        redirect_to category_item_path(@item.category, @item)
      else
        render :edit, :notice => 'there was an error'
      end
    end
  end

  def destroy
    if @item.user.id == session[:user_id]
      @item.destroy
      redirect_to '/inventory'
    else
      render :edit, :notice => "This item is sold by another user."
    end
  end

  def add_to_cart
    set_item
    @user = User.find(session[:user_id])
    if session[:user_id]
      if @item.quantity > @user.cart.select{|cart| cart.item.name == @item.name}.count
        if @item.user.id != session[:user_id]
          @user = User.find(session[:user_id])
          @item = Item.find(params[:id])
          Cart.create(user: @user, item: @item)
          redirect_to '/cart'
        else
          render :show, :notice => 'You can\'t add your own item to cart'
        end
      else
        render :show, :notice => 'Maximum available quantity has been added to cart'
      end
    else
      render :show, :notice => 'Please sign in to add items to cart'
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :price, :quantity, :user_id, :image, :description, :category_id, :term)
  end
end
