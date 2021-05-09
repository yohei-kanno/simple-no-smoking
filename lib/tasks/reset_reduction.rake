namespace :reset_reduction do
  desc "1分毎に減煙情報を０にする"
  task reduction: :environment do
    logger = Logger.new 'log/reset_reduciton.log'
    begin
      reduction_user_profiles = ReductionUserProfile.all
      reduction_user_profiles.each do | profile | 
        profile.stocks.create(counter: profile.smoking_count)
        profile.update(smoking_count: 0)
      end
    rescue => e
      logger.error "エラーです！"
      logger.error e
      logger.error e.backtrace.join("\n")
      next
    end
  end
end
