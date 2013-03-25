class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params[:item])

    if @item.save
      @product_id = params[:item][:product_id]
      flash[:notice] = "Item #{@product_id} has been added."
      redirect_to @item
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "Item has been removed."
    redirect_to items_path
  end

  def remove #removes multiple items
    params[:items] && params[:items].each do |product_id, item_id|
      item = Item.find(item_id)
      item.destroy
    end
    removed = params[:items].keys.join(", ")
    flash[:notice] = "Items #{removed} have been removed."
    redirect_to items_path
  end

  def show
    @item = Item.find(params[:id])
  end

end
