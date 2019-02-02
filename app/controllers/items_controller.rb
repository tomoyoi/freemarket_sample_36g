class ItemsController < ApplicationController
  def index
  end

  def mypage_show
    @item = Item.first
  end
  # def create
  #   Item.create(image: item_params[:image],name: item_params[:name], description: item_params[:description], delivery_fee: item_params[:delivery_fee], area: item_params[:area], price: item_params[:price], size: item_params[:size], user_id: current_user.id)
  # end

  def destroy
    item = Item.find(params[:id])
    #後でcurrent_userのIDがmypageのIDと同じである条件をかく
    item.destroy 
    redirect_to controller: "users", action: "mypage"
  end

  private 
  def item_params
    params.permit(:image, :name, :description, :delivery_fee, :area, :price, :size)
  end
end
