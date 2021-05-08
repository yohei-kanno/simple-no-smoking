namespace :reset_reduction do
  desc "1分毎に減煙情報を０にする"
  task reduction: :environment do
    logger = Logger.new 'log/reset_reduciton.log'
    begin
      ReductionUserProfile.first.update(start_date: DateTime.current)
    rescue => e
      logger.error "エラーです！"
      logger.error e
      logger.error e.backtrace.join("\n")
      next
    end
  end
end
    
