# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # GET /resource/sign_up
  def new
    @user = User.new
  end

  # POST /resource
  def create
    super
  end
end
