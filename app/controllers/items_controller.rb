class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    4.times { @item.images.build }
  end

   def create
    @item = Item.new(item_params)
    binding.pry
      if @item.save
        redirect_to root_path
      else
        render :new
      end
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
    Payjp.api_key = 'sk_test_83f204a9bb34db179788dad1'
      charge = Payjp::Charge.create(
        amount: @item.price,
        card: params[:'payjp-token'],
        currency: 'jpy',
        )
  # @item.buyer_id = current_user.id
  # @item.save
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
    params.permit(:name, :description, :delivery_fee, :area, :price, :price, :size, :condition, :delivery_method, :standard_shippiont_time, :brand, :seller_id, :buyer_id, image_attributes:[:id, :item_id])
  end

end
