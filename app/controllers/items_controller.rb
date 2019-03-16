class ItemsController < ApplicationController
  before_action :user_login?, only: [:new, :create, :edit, :destroy, :pay]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @item.images.build
    @sizes = Size.all
  end

   def create
    @item = Item.new(item_params)
      if @item.save
        params[:image].each do |i|
          @item.images.create(item_id: @item.id, image: i)
        end
        redirect_to root_path
      else
        @item.images.build
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
        @item.update!(buyer_id: current_user.id)
    redirect_to root_path
  end

  def destroy
    item = Item.find(params[:id])
    # item.destroy if item.current_user.id == current_user.idに変更
    item.destroy
    redirect_to controller: "users", action: "mypage"
  end

  def update
    item = Item.find(params[:id])
    # item.update if item.current_user.id == current_user.idに変更
    item.update(item_params)
    redirect_to controller: "users", action: "mypage"
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :delivery_fee, :area, :price, :condition, :delivery_method, :standard_shipping_time, :brand, :seller_id, :size_id, :category_id, image_attributes:[:id, :image, :item_id, :user_id])
  end

  def user_login?
    unless current_user.present?
      redirect_to users_path
    end
  end

end
