class AdminController < ApplicationController
  before_filter { |c| c.authorize 'all' }

  def home
    @users = User.all
  end
end