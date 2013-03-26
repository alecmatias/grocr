class ProductsController < ApplicationController
  before_filter :find_product, :only => [:show, :edit,  :update, :destroy]
  before_filter :authorize_admin!, :except => [:index, :show]
  before_filter :find_product, :only => [:show, :edit, :update, :destroy]

  def index
    @products= Product.all
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

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes(params[:product])
    flash[:notice] = "Product has been updated."
    redirect_to @product
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product has been deleted."
    redirect_to products_path
  end

  def find_product
    @product = Product.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The product you were looking for could not be found."
    redirect_to products_path
  end

  private
    def authorize_admin!
      authenticate_user!
      unless current_user.admin?
        flash[:alert] = "You must be an admin to do that."
        redirect_to root_path
      end
    end
end
