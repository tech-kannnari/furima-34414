class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :find_params, only:[:show, :edit, :update]

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
    if @item.user == current_user
      render :edit
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :item_status_id, :delivery_fee_id, 
      :delivery_area_id, :delivery_day_id, :price).merge(user_id: current_user.id) 
  end

  def find_params
    @item = Item.find(params[:id])
  end

end
