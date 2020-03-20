class ProductsController < ApplicationController

  def new
    @product = Product.new
    @product.product_image.build
  end

  def create
    @product = Product.new(product_params)
    binding.pry
    if @product.save!
      params.require(:product_image).permit(:image).each do |image|
        @image = @product.product_image.create!(image: image)
      end
      redirect_to root_path, notice: '商品を出品しました'
      else
        @product.product_image.build
        render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :condition, :shipping_charges, :shipping_area, :days_to_delivery, :price, product_image_attributes: :image)
  end
end