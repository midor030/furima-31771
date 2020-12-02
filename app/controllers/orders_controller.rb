class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @user_item = UserItem.new
  end

  def create
    @item = Item.find(params[:item_id])
    @user_item = UserItem.new(order_params)
    if @user_item.valid?
      pay_item
      @user_item.save
      return redirect_to items_path
    else
      render action: :index
    end
  end

  private
  def order_params
    params.require(:user_item).permit(:postcode, :prefecture, :cities, :address, :building, :tel).merge(token: params[:card_token],price: @item.price, user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = "sk_test_e82df4b9f3f5350e4e8e6cf9"
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end