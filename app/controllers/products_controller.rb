class ProductsController < ApplicationController

  def new
    @product = Product.new
    @product.product_image.build
  end

  def create
    @product = Product.new(product_params)
    @product_image = Product_image.new(product_image_params)
    if @product.save!
      if @product_image.save!
        redirect_to root_path, notice: '商品を出品しました'
      else
        render :new
      end
    else
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :condition, :shipping_charges, :shipping_area, :days_to_delivery, :price)
  end

  def product_image_params
    params.require(:product_image).permit(:image)
  end
end