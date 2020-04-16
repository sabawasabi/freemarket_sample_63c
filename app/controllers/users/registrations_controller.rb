# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  def new
    @user = User.new
  end

  def create
    super
  end

  def edit
  end

  def update
  end
end
