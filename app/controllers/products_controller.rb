class ProductsController < ApplicationController
  before_action :set_product, only: [:edit, :update]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to products_url
  end

  def edit

  end

  def update
    @product.update(product_params)
    redirect_to products_url
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end


  def product_params
    params.require(:product).permit(:name, :price, :description, :photo)
  end

end
