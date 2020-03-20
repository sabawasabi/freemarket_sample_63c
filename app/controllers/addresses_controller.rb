class AddressesController < ApplicationController
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
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    if @address.save
      redirect_to edit_address_path(@address.id)
    else
      render :edit
    end
  end

  private
  def address_params
    params.require(:address).permit(:postal_code, :prefectures, :city, :house_number, :building, :phone_number)
  end

end
