class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :find_params, only:[:show, :edit, :update]
  before_action :redairect_to_root, only:[:edit, :update]

  def index
     @items = Item.all.order("created_at DESC")
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

  def show
  end

  def edit
  end

  def update
  end

private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :item_status_id, :delivery_fee_id, 
      :delivery_area_id, :delivery_day_id, :price).merge(user_id: current_user.id) 
  end

  def find_params
    @item = Item.find(params[:id])
  end

  def redairect_to_root
    unless @item.user == current_user
      redirect_to root_path
    end
  end

end
