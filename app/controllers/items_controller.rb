class ItemsController < ApplicationController

  before_filter :authenticate_user!, :only => [:index, :show, :new, :create]

  def index
    @item = current_user.items.all
  end

  def new
    @item = current_user.items.new
  end

  def create
    @item = current_user.items.new(params[:item])

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
