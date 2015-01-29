require File.expand_path('../boot', __FILE__)
require 'rails/all'
Bundler.require(*Rails.groups)

module WhoIsHiring
  class Application < Rails::Application
    config.autoload_paths << Rails.root.join('lib')
    require_relative '../lib/scraper/scraper.rb'
    config.active_job.queue_adapter = :sucker_punch
    SuckerPunch.logger = Logger.new(Rails.root.join('log', 'sucker_punch.log'))
  end
end
