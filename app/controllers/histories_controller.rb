class HistoriesController < ApplicationController

  before_action :authenticate_user!, only: [:index, :create]
  

  def index
    @history_buyer = HistoryBuyer.new
  end

  def new
  end

  def create
    @history_buyer = HistoryBuyer.new(history_params)
    if @history_buyer.valid?
      pay_item
      @history_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  
  def history_params
    params.require(:history_buyer).permit(:item, :user, :postal_code, :delivery_area_id, :municipalities, :address, :building,
      :phone_number, :history, :price).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @history.price,
        card: history_params[:token],
        currency: 'jpy'
      )
  end


end
