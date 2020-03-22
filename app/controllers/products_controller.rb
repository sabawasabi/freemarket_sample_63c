class ProductsController < ApplicationController
  # before_action :move_to_index, except: [:index, :show]
  # before_action :get_product, only: [:show, :destroy, :edit, :update]

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

  def edit
    @product = Product.find(params[:id])
  end

  def update
    if @product.user_id == current_user.id && @product.update(product_params)
      redirect_to root_path
    else
      render 'products/edit'
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :condition, :shipping_charges, :shipping_area, :days_to_delivery, :price)
  end

  # def move_to_index
  #   redirect_to action: :index unless user_signed_in?
  # end
end
