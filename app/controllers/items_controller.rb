class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

   def create
    binding.pry
    @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
      else
        render :new
      end
    end

  def show
    @item = Item.find(params[:id])
  end

  def edit
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
    redirect_to root_path

  end

  def destroy
    item = Item.find(params[:id])
    # item.destroy if item.current_user.id == current_user.idに変更
    item.destroy
    redirect_to controller: "users", action: "mypage"
  end

  private
  def item_params
    params.permit(:name, :description, :delivery_fee, :area, :price, :price, :size, :condition, :delivery_method, :standard_shippiont_time, :brand, :seller_id, :buyer_id)
  end

end
