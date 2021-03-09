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

  

end
