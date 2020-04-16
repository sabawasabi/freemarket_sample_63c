class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  def new
    @user = User.new
  end

  def create
    @user = User.new(configure_permitted_parameters)
    if @user.save
    redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name, :first_name, :last_name_jp, :first_name_jp, :birth_date, :phone_number, :profile, :icon])
  end
end
