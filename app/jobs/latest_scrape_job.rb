class LatestScrapeJob
  include SuckerPunch::Job

  def perform
    SuckerPunch.logger.info '# LatestScrapeJob performing'
    post = Post.recent.limit(1)
    Scraper::Jobs.run!(post)
  ensure
    LatestScrapeJob.new.async.later if Rails.env.production?
  end

  def later(seconds = 1.hour.to_i)
    SuckerPunch.logger.info "# LatestScrapeJob sleeping #{ seconds } seconds"
    after(seconds) { perform }
  end
end