class StocksController < ApplicationController
  layout 'reduction'
  def index
    if current_user.reduction_user_profile.stocks.count < 1
      flash.now[:remysuccess] = t(".no_record")
    end
  end
end
