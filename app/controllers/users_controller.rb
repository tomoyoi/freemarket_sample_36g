class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def confirm
    @user = User.new(signup_params)

    if @user.valid?
      render :action => 'confirm'
    else
     redirect_to new_user_path
    end
  end

  def show
      @nickname = current_user.nickname
      @items = current_user.items
  end

  def mypage
    @user = User.find(params[:id])
  end

  private

  def signup_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :prefecture,
      :city,
      :postcode,
      :house_number,
      :building,
      :tel_number,
      :profile
    )
  end
end
