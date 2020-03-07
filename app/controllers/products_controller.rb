class ProductsController < ApplicationController
  def new
    @product = Product.new
    @product.condition = "出品中"
  end

  def create
    binding.pry
  end

end
