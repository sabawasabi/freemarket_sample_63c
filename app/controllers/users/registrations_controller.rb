class Users::RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
  end

  def create
    super
  end

  def edit_address
  end

  def update
  end
end
