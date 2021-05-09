module ApplicationHelper
    
  #日付毎のカウンター
  def stocker
    current_user.reduction_user_profile.stocks.map do | stock |
      stock
    end
  end
  
  def stocker_value
    current_user.reduction_user_profile.stocks.map do | stock |
      stock.counter
    end
  end
  
  # ユーザーの1本辺りの金額
  def one_smoke_price
    current_user.reduction_user_profile.tabaco_price / 20
  end
  

  #吸った合計本数
  def sum_value
    stocker_value.inject(:+)
  end
    
  
end
