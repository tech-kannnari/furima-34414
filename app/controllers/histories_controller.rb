class HistoriesController < ApplicationController
 
  def index
  end

  def new
    @history = History.new
  end

  def create
    @history = History.new(history_params)
    @item = Item.find(params[:id])
    if @history.save
      redirect_to item_path(@item.id)
    else
      render :new
    end
  end

  private

  
  
  def history_params
    params.permit(:item, :user).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def buyer_params
    params.permit(:postal_code, :delivery_area_id, :municipalities, :address, :building,
       :phone_number, :history).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
