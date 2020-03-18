class TopsController < ApplicationController
  def index
    @product = Product.order("created_at DESC").limit 3
  end
end
