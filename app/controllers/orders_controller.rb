class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @user_item = UserItem.new
  end

  def create
    @item = Item.find(params[:item_id])
    @user_item = UserItem.new(order_params)
    if @user_item.valid?
      @user_item.save
      redirect_to items_path
    else
      render action: :index
    end
  end

  private
  def order_params
    params.permit(:item, :user, :postcode, :prefecture, :cities, :address, :building, :tel)
  end
end