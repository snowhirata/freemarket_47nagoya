class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    if @category.main_category_id.nil? && @category.sub_category_id.nil?

      @child_category = Category.where(main_category_id: @category.id).where(sub_category_id: nil).where.not(name: "その他")
      @items = Item.where(category_id: @category.id).page(params[:page]).per(12).order(id: "DESC")

    elsif @category.main_category_id.present? && @category.sub_category_id.nil?

      @grand_child_category = Category.where(sub_category_id: @category.id).where.not(name: "その他")
      @items = Item.where(child_category_id: @category.id).page(params[:page]).per(12).order(id: "DESC")

    else
      @items = Item.where(grand_child_category_id: @category.id).page(params[:page]).per(12).order(id: "DESC")
    end
  end
end
