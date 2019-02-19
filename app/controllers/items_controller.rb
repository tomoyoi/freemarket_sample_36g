class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def mypage_show
    # @item = current_user.items.firstに変更予定
    @item = Item.first
  end

  def buy
    @item = Item.find(params[:id])
  end

  def pay
    @item = Item.find(params[:id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      charge = Payjp::Charge.create(
        amount: @item.price,
        card: params[:'payjp-token'],
        currency: 'jpy',
        )
  # @item.buyer_id = current_user.id ユーザー側実装次第変更予定
  # @item.save 同上
    redirect_to item_url(@item)

  end

  # def create
  #   Item.create(image: item_params[:image],name: item_params[:name], description: item_params[:description], delivery_fee: item_params[:delivery_fee], area: item_params[:area], price: item_params[:price], size: item_params[:size], user_id: current_user.id)
  # end

  def destroy
    item = Item.find(params[:id])
    # item.destroy if item.current_user.id == current_user.idに変更
    item.destroy
    redirect_to controller: "users", action: "mypage"
  end

  private
  def item_params
    params.permit(:image, :name, :description, :delivery_fee, :area, :price, :size)
  end

end
