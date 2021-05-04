module NoSmokingUserProfileHelper
  
  #ユーザーの禁煙した秒数
  def smoking_in_second
    DateTime.now.to_i - @user.no_smoking_user_profile.created_at.to_i
  end
  
  #禁煙した日数
  def smoking_in_day
    smoking_in_second / 86400
  end
  
  # ユーザーの１本辺りの金額
  def one_smoke_price
    @user.no_smoking_user_profile.tabaco_price / 20.0
  end
    
  #ユーザーの１日辺りの金額
  def one_day_price
    one_smoke_price * @user.no_smoking_user_profile.smoking_pace
  end
  
  #ユーザーが1秒辺りいくら使っているのか
  def one_minute_price
    one_day_price / 86400
  end
  
  #ユーザーが何秒に1本吸っているのか
  def one_every_second
    86400 / @user.no_smoking_user_profile.smoking_pace
  end
  
  #ユーザーの生きた秒数
  def life_time
    DateTime.now.to_i - @user.birth_date.to_i
  end
  
  #80年生きた際の残りの秒数
  def life_time_80
    86400 * 365 * 80 - life_time
  end
    
  #禁煙時間
  def no_smoking_time
      (Time.parse("1/1") + (smoking_in_second - smoking_in_day * 86400)).strftime("#{smoking_in_day}日%H時間%M分%S秒")
  end
      
  #得した金額
  def amount_of_money_earned
    (one_minute_price * smoking_in_second).floor
  end

  #我慢した本数
  def patience_number
    smoking_in_second / one_every_second
  end

  #得した時間
  def gained_time
    patience_number * 5
  end
      
  #失う時間
  def lost_time_80
    smoking_in_life = life_time_80 / one_every_second
    smoking_in_life * 300 / 3600
  end
    
  def lost_money_80
    (one_minute_price * life_time_80).floor
  end
  
  def lost_hours_money_80
    lost_time_80 * @user.no_smoking_user_profile.hourly_wage
  end
end
