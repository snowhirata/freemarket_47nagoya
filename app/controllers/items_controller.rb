class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    10.times { @item.pictures.build }
    3.times { @item.category_items.build }
  end

  def create
    @item = Item.create(item_params)
    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :description,:state, :brand, :ship_charge, :prefecture_id, :ship_method, :ship_date, :price, pictures_attributes: [:id, :image, :_destroy], category_items_attributes: [:id, :category_id, :_destroy])
  end

  def category_params
  end
end
