module ReductionUserProfilesHelper
  
  #減煙期間
  def smoking_in_second
    DateTime.now.to_i - current_user.reduction_user_profile.start_date.to_i
  end
  
  #減煙した日数
  def smoking_in_day
    smoking_in_second / 86400
  end
  
   #減煙期間
   def reduction_time
    (Time.parse("1/1") + (smoking_in_second - smoking_in_day * 86400)).strftime("#{smoking_in_day.to_s(:delimited)}日%H時間%M分%S秒")
end
  
  #今日吸える本数
  def you_can_smoke
    (current_user.reduction_user_profile.smoking_pace.to_i)-(current_user.reduction_user_profile.smoking_count)
  end
  
  #今日使った金額
  def used_money
    ((current_user.reduction_user_profile.tabaco_price / 20.0) * current_user.reduction_user_profile.smoking_count).floor.to_s(:delimited)
  end
  
  def used_time_second
    current_user.reduction_user_profile.smoking_count * 5 * 60
  end
  
  def used_time_day
    (used_time_second / 86400).floor
  end
  
  def used_time_final
    (Time.parse("1/1") + (used_time_second - used_time_day * 86400)).strftime("#{used_time_day.to_s(:delimited)}日%H時間%M分%S秒")
  end
  
  def lost_life_second
    current_user.reduction_user_profile.smoking_count * 5.5 * 60
  end
  
  def lost_life_day
    (lost_life_second / 86400).floor
  end
  
  def lost_life_final
    (Time.parse("1/1") + (lost_life_second - lost_life_day * 86400)).strftime("#{lost_life_day.to_s(:delimited)}日%H時間%M分%S秒")
  end
  
  def lost_wage
    ((used_time_second / 3600.0) * current_user.reduction_user_profile.hourly_wage).floor.to_s(:delimited)
  end
  
end
