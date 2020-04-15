class AddressesController < ApplicationController
  before_action :set_address, only: [:edit, :update]
  before_action :set_user_id, only: [:new, :create, :edit, :update]
  
  def new
    if @user.address == nil
      @address = Address.new
    else
      redirect_to edit_user_address_path(@user, @user.address.id)
    end
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to edit_user_address_path(@user, @user.address.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to edit_user_address_path(@user)
    else
      render :edit
    end
  end

  private
  def address_params
    params.require(:address).permit(:last_name, :first_name, :last_name_jp, :first_name_jp, :postal_code, :prefectures, :city, :house_number, :building, :phone_number).merge(user_id: current_user.id)
  end

  def set_address
    @address = Address.find(params[:id])
  end

  def set_user_id
    @user = current_user
  end
end
