class SoldController < ApplicationController
  before_action :set_item, only: [:index, :update]

  def index
  end

  def show
  end

  def update
    if @item.update(item_params)
      if customer = current_user.credit.cus_id
        Mypayjp.create_charge_by_customer(customer,params[:item][:item_price])
      end
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def set_item
    @item = Item.find(params[:item_id])
  end

  def item_params
    params.require(:item).permit(:buyer_id)
  end
end
