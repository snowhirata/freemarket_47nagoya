class SoldController < ApplicationController

  def index
    @item = Item.find(item_params[:item_id])
  end

  def show
  end

  private
  def item_params
    params.permit(:item_id)
  end
end
