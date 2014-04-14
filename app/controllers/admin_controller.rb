class AdminController < ApplicationController
  before_filter { |c| c.authorize 'all' }

  # Public: Home page
  # 
  # Authorize 'all'
  def home
  end
end