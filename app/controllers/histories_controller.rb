class HistoriesController < ApplicationController

  def index
    @history = Item.find(params[:item_id])
    @history_buyer = HistoryBuyer.new
  end

  def new
  end

  def create
    @history_buyer = HistoryBuyer.new(history_params)
    if @history_buyer.valid?
      @history_buyer.save
      redirect_to root
    else
      render :new
    end
  end

  private
  
  def history_params
    params.require(:history_buyer).params.permit(:item, :user, :postal_code, :delivery_area_id, :municipalities, :address, :building,
      :phone_number, :history).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
