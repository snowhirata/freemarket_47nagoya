class UsersController < ApplicationController
  before_action :set_user, only: [:identification]
  layout 'user'
  def index
    @user = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def identification
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
