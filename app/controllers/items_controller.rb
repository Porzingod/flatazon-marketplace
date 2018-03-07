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
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to category_item_path(@item.category, @item)
    else
      render :edit
    end
  end

  def destroy
    if item[:owner_id] == session[:user_id]
      item.destroy
    else
      error "you do not have permission to delete this item"
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
          render :show
          #can't add own item to cart
        end
      else
        render :show
        #can't add greater qty than available
      end
    else
      render :show
      #can't add items to cart unless signed in
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
