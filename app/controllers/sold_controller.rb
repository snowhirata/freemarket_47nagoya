class SoldController < ApplicationController
  before_action :set_item, only: [:index, :update]

  def index
  end

  def show
  end

  def update
    
    if current_user.credit
      customer = current_user.credit.cus_id
      @item.update(item_params)
      Mypayjp.create_charge_by_customer(customer,params[:item][:item_price])
    else
      flash[:credit] = '支払い情報を登録してください'
      redirect_to new_credit_path
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
