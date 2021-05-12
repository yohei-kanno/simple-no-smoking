module NoSmokingUserProfilesHelper
  def smoking_in_second
    DateTime.now.to_i - current_user.no_smoking_user_profile.start_date.to_i
  end
  
  #禁煙した日数
  def smoking_in_day
    smoking_in_second / 86400
  end
  
  # ユーザーの１本辺りの金額
  def one_smoke_price
    current_user.no_smoking_user_profile.tabaco_price / 20.0
  end
    
  #ユーザーの１日辺りの金額
  def one_day_price
    one_smoke_price * current_user.no_smoking_user_profile.smoking_pace
  end
  
  #ユーザーが1秒辺りいくら使っているのか
  def one_minute_price
    one_day_price / 86400
  end
  
  #ユーザーが何秒に1本吸っているのか
  def one_every_second
    86400 / current_user.no_smoking_user_profile.smoking_pace
  end
  
  
  
  #ユーザーの生きた秒数
  def life_time
    DateTime.now.to_i - current_user.birth_date.to_i
  end
  
  #80年生きた際の残りの秒数
  def life_time_80
    86400 * 365 * 80 - life_time
  end
    
  #禁煙時間
  def no_smoking_time
      (Time.parse("1/1") + (smoking_in_second - smoking_in_day * 86400)).strftime("#{smoking_in_day}日%H時間%M分%S秒")
  end
  
  #ユーザーの伸びた寿命(秒)
  def gained_life_second
    patience_number * 5.5 * 60
  end
  
  #ユーザーの伸びた寿命(日)
  def gained_life_day
    (gained_life_second / 86400).floor
  end
  
  def gained_life
      (Time.parse("1/1") + (gained_life_second - gained_life_day * 86400)).strftime("#{gained_life_day}日%H時間%M分%S秒")
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
  
  #我慢した長さ
  def gained_longth
    patience_number * 8
  end
      
  #失う時間
  
  def lost_time_80_final
    (Time.parse("1/1") + (lost_time_80_second - lost_time_80_day * 86400)).strftime("#{lost_time_80_day}日%H時間%M分%S秒")
  end
  
    def life_time_80_day
    life_time_80 / 86400
  end
  
  def lost_time_80
    #生涯で何本タバコを吸うのか=>smoking_in_life
    smoking_in_life = life_time_80 / one_every_second
    smoking_in_life * 300 / 3600
  end
  
  def lost_time_80_second
      (life_time_80 / one_every_second) * 5 * 60
  end
  
  def lost_time_80_day
    (lost_time_80_second / 86400).floor
  end
  
  def lost_life_80_second
    (life_time_80 / one_every_second) * 5.5 * 60
  end
  
  def lost_life_80_day
    (lost_life_80_second / 86400).floor
  end
  
  def lost_life_80_final
    (Time.parse("1/1") + (lost_life_80_second - lost_life_80_day * 86400)).strftime("#{lost_life_80_day}日%H時間%M分%S秒")
  end
    
  def lost_money_80
    (one_minute_price * life_time_80).floor
  end
  
  def lost_hours_money_80
    lost_time_80 * current_user.no_smoking_user_profile.hourly_wage
  end
 
end
