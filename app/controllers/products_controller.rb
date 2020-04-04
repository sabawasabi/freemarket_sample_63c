class ProductsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @product = Product.order("created_at DESC").limit 3
  end

  def new
    @product = Product.new
    @product_images = @product.product_images.build
  end

  def create
    @product = Product.new(product_params)
    if @product.save!
      redirect_to root_path, notice: '商品を出品しました'
    else
      @product.product_images.build
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :condition, :shipping_charges, :shipping_area, :days_to_delivery, :price, [product_images_attributes: [:image]]).merge(user_id: current_user.id)
  end
end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
