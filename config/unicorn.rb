before_fork do |server, worker|
  @scrape_pid ||= spawn('bundle exec rake scrape')
end