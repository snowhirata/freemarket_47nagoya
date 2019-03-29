class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    10.times { @item.pictures.build }
  end

  def create
    @item = Item.create(item_params)
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
  end
end
