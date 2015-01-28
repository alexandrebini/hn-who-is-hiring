require File.expand_path('../boot', __FILE__)
require 'rails/all'
Bundler.require(*Rails.groups)

module WhoIsHiring
  class Application < Rails::Application
    config.autoload_paths << Rails.root.join('lib')
    require_relative '../lib/scrapper/scrapper.rb'
  end
end
