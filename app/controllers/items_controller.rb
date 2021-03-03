class ItemsController < ApplicationController
  
  def index
    @items = item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end


  def item_params
    params.require(:item).permit(:name, :description, :category_id, :item_status_id, :delivery_fee_id, 
      :delivery_area_id, :delivery_day_id, :price).merge(user_id: current_user.id,) 
  end

end
