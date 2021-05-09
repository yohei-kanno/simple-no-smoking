class StocksController < ApplicationController
  before_action :set_mode
  before_action :require_login
  
  layout 'reduction'
  def index
  end
end
