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

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
  end
end
