class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @items = Item.order("created_at DESC")  
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item, :explain, :image, :category_id, :state_id, :load_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end

end
