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
    else
      #
    end
  end

  def show
    @item = Item.find(params[:id])
  end

end
