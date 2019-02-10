class ItemsController < ApplicationController
  def index
    @items = Item.all;
  end

  def show
    @item = Item.find(1)
  end

end
