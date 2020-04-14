class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user, only: [:show, :logout]
  
  def show
  end

  def logout
  end

  private
  def set_current_user
    @user = current_user
  end
end
