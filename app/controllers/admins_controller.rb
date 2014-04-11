class AdminsController < ApplicationController

  def home
    authorize
    eventize
    @users = User.all
  end
end