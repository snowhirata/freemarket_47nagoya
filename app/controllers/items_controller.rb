class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :destroy]

  def index
    @items = Item.includes(:pictures).limit(4).order("updated_at DESC")
  end

  def new
    @item = Item.new
    10.times { @item.pictures.build }
    3.times { @item.category_items.build }
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

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :description,:state, :brand, :ship_charge, :prefecture_id, :ship_method, :ship_date, :price, pictures_attributes: [:id, :image, :_destroy], category_items_attributes: [:id, :category_id, :_destroy])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
