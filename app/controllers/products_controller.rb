class ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      flash[:notice] = "Product has been created."
      redirect_to @product
    else
      #
    end
  end

  def show
    @product = Product.find(params[:id])
  end

end
