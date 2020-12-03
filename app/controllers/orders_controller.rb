class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    if (current_user.id == @item.user.id) || !@item.order.nil?
      redirect_to root_path
    else
      @user_item = UserItem.new
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @user_item = UserItem.new(order_params)
    if @user_item.valid?
      pay_item
      @user_item.save
      redirect_to items_path
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:user_item).permit(:postcode, :prefecture, :cities, :address, :building, :tel).merge(token: params[:card_token], item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
