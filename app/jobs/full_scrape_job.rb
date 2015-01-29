class FullScrapeJob
  include SuckerPunch::Job

  def perform
    SuckerPunch.logger.info '# FullScrapeJob performing'
    Scraper::Posts.run!
    Scraper::Jobs.run!
  ensure
    FullScrapeJob.new.async.later if Rails.env.production?
  end

  def later(seconds = 12.hours.to_i)
    SuckerPunch.logger.info "# FullScrapeJob sleeping #{ seconds } seconds"
    after(seconds) { perform }
  end
end