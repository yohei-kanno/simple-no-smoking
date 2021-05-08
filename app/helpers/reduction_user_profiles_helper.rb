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
    (Time.parse("1/1") + (smoking_in_second - smoking_in_day * 86400)).strftime("#{smoking_in_day}日%H時間%M分%S秒")
end
  
  #今日吸える本数
  def you_can_smoke
    (current_user.reduction_user_profile.smoking_pace.to_i)-(current_user.reduction_user_profile.smoking_count)
  end
  
  #今日使った金額
  def used_money
    (current_user.reduction_user_profile.tabaco_price / 20.0) * current_user.reduction_user_profile.smoking_count
  end
  
  #今日使ったタバコに使った時間
  def used_time
    current_user.reduction_user_profile.smoking_count * 5
  end
  
  start_date = Time.current.beginning_of_day
  end_date = Time.current.end_of_day
  
  count_smoking = ReductionUserProfile.where(created_at: start_date..end_date).pluck(:smoking_count)
  
end
