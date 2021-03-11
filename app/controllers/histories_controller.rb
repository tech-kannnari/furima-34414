class HistoriesController < ApplicationController

  before_action :authenticate_user!, only: [:index, :create]
  before_action :find_params, only:[:index, :create]
  before_action :redirect_to_root, only:[:index, :create]

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

  def find_params
    @history = Item.find(params[:item_id])
  end

  def redirect_to_root
    if @history.user == current_user
      redirect_to root_path
    end
  end
end
