class ProductsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save!
      redirect_to root_path, notice: '商品を出品しました'
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :condition, :shipping_charges, :shipping_area, :days_to_delivery, :price)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
