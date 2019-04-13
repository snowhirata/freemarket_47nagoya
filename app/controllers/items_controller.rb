class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :destroy, :update]

  def index
    @items = Item.includes(:pictures).limit(4).order("updated_at DESC")
  end

  def search
      @categories = Category.all
      @allitems = Item.all
      @q = Item.ransack(params[:q])
      @items = @q.result(distinct: true)
      #キーワード検索
      @items = Item.where("name LIKE?", "%#{params[:keyword]}%") if params[:keyword]
  end

  def sort
    if params[:sort] == 'new'
      @items=Item.includes(:pictures).order('created_at ASC')
    elsif params[:sort] == 'old'
      @items=Item.includes(:pictures).order('created_at DESC')
    elsif params[:sort] == 'cheap'
      @items=Item.includes(:pictures).order('price DESC')
    else params[:sort] == 'high'
      @items=Item.includes(:pictures).order('price ASC')
    end
    render partial: '/items/result', locals: { items: @items }
  end

  def new
    @item = Item.new
    10.times { @item.pictures.build }
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
    @item = Item.find(params[:id])
    @comment = Comment.new
    @comments = @item.comments
  end

  def edit
    render :new
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :new
    end
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
    params.require(:item).permit(:name, :user_id, :category, :description,:state, :brand, :ship_charge, :prefecture_id, :ship_method, :ship_date, :buyer_id, :price, pictures_attributes: [:id, :image, :_destroy])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
