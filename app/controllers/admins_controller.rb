class AdminsController < ApplicationController

  def home
    authorize
    @users = User.all
  end
end