class TransactionsController < ApplicationController
  require 'payjp'
  before_action :set_card, only: [:pay_index, :pay]
  before_action :set_product

  def pay_index
    @top_image = @product.images.first
    @card = @set_card.first
    if @card.blank?
      redirect_to controller: "credits", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  def pay
    @card = @set_card.first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => @product.price,
    :customer => @card.customer_id,
    :currency => 'jpy',
  )
  redirect_to action: 'done', product_id: @product
  end

  def done
    @top_image = @product.images.first
    Transaction.create(product_id: @product.id, user_id: current_user.id)
  end

  private

  def set_card
    @set_card = Credit.where(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

end
