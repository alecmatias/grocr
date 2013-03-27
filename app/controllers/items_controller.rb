class ItemsController < ApplicationController

  before_filter :authenticate_user!, :only => [:index, :show, :new, :create]

  def index
    @item = current_user.items.all
  end

  def new
    @list = current_user.list
    @products = Product.all
  end

  def create
    @product = Product.find(params[:product])
    @item = current_user.list.items.new(:product => @product, :quantity => 1)

    if @item.save
      flash[:notice] = "Item #{@product.id} has been added to your list."
      redirect_to new_item_path
    else
      flash[:alert] = "Item has not been added."
      redirect_to new_item_path #just showing the HTML for it, doesn't do controller logic
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "Item #{@item.product_id} has been removed."
    redirect_to new_item_path
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
