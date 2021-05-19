class StocksController < ApplicationController
  layout 'reduction'
  
  PER = 10
  
  def index
    @stocks = current_user.reduction_user_profile.stocks.page(params[:page]).per(PER).reverse_order
    if current_user.reduction_user_profile.stocks.count < 1
      flash.now[:remysuccess] = t(".no_record")
    end
  end
end
