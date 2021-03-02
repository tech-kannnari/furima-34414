class ItemsController < ApplicationController
  
  def index
  end

  def new
  end

  def create
  end


  def item_params
    params.require(:item).permit(:name, :description, :category_id, :item_status_id, 
      :delivery_fee_id, :delivery_area_id, :delivery_day_id, :price, :user)
  end

end
