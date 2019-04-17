class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :destroy, :update]
  before_action :set_category, only: [:new, :edit, :update,:create, :search]

  def index
    @items = Item.includes(:pictures).limit(4).order("updated_at DESC")
    @ladies = Item.where(category_id: 1).limit(4).order("updated_at DESC")
    @mens = Item.where(category_id: 2).limit(4).order("updated_at DESC")
    @kids = Item.where(category_id: 3).limit(4).order("updated_at DESC")
    @cosmetics = Item.where(category_id: 7).limit(4).order("updated_at DESC")
    @categories = Category.where(depth: 1).order("id ASC")
    @child_categories = Category.where(depth: 2).where(main_category_id: params[:id]).order("id ASC").limit(14)
    @grand_child_categories = Category.where(depth: 3).where(sub_category_id: params[:g_id]).order("id ASC").limit(14)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def search
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)
    if @items == []
      @items = nil
    else
      @items
    end

    if params[:keyword] == ''
      @items = nil
    elsif params[:keyword]
      @items = Item.where("name LIKE?", "%#{params[:keyword]}%") 
    end
  end

  def sort
    if params[:sort] == 'new'
      @items=Item.includes(:pictures).order('created_at DESC')
    elsif params[:sort] == 'old'
      @items=Item.includes(:pictures).order('created_at ASC')
    elsif params[:sort] == 'cheap'
      @items=Item.includes(:pictures).order('price ASC')
    else params[:sort] == 'high'
      @items=Item.includes(:pictures).order('price DESC')
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
    @user_other_items = Item.where(user_id: @item.user.id).where.not(id: params[:id]).limit(6)
    @category_other_items = Item.where(category_id: @item.category.id).where.not(id: params[:id]).limit(6)

    @categories = Category.where(depth: 1).order("id ASC")
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

  def category_select
    @child_category = Category.where(main_category_id: params[:item][:category_id]).where(sub_category_id: nil)
    @main_category_num = params[:item][:category_id]
  end

  def category_select_search
    @child_category = Category.where(main_category_id: params[:q][:category_id_eq]).where(sub_category_id: nil)
    @main_category_num = params[:q][:category_id_eq]
  end

  def child_category_select
    child_category = Category.find(params[:item][:child_category_id])
    @grand_child_category = Category.where(main_category_id: child_category.main_category_id).where(sub_category_id: child_category.id)
    @grand_child_category_num = params[:item][:child_category_id]
  end

  def child_category_select_search
    child_category = Category.find(params[:q][:child_category_id_eq])
    @grand_child_category = Category.where(main_category_id: child_category.main_category_id).where(sub_category_id: child_category.id)
    @grand_child_category_num = params[:q][:child_category_id_eq]
  end

  private

  def item_params
    params.require(:item).permit(:name, :user_id, :category_id, :child_category_id, :grand_child_category_id, :description,:state, :brand, :ship_charge, :prefecture_id, :ship_method, :ship_date, :buyer_id, :price, pictures_attributes: [:id, :image, :_destroy])
  end

  # def search_params
  #   params.require(:q).permit(:name_cont, :category_id_eq,:child_category_id_eq, {:grand_child_category_id_eq => []},:brand_cont,:price_gteq,:price_lteq)
  # end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_category
    @child_category = []
    @category = Category.where(main_category_id: nil).where(sub_category_id: nil)
    @category.each do |category|
      @child_category << Category.where(main_category_id: category.id).where(sub_category_id: nil)
    end
  end
end
