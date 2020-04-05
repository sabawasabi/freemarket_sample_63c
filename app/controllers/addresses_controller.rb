class AddressesController < ApplicationController
  before_action :set_address, only: [:edit, :update]
  
  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to edit_address_path(@address.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to edit_address_path(@address.id)
    else
      render :edit
    end
  end

  private
  def address_params
    params.require(:address).permit(:last_name, :first_name, :last_name_jp, :first_name_jp, :postal_code, :prefectures, :city, :house_number, :building, :phone_number)
  end

  def set_address
    @address = Address.find(params[:id])
  end

end
