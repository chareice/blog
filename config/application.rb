require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env)

module Blog
  class Application < Rails::Application
    config.i18n.enforce_available_locales = true
    config.time_zone = 'Beijing'
    I18n.config.enforce_available_locales = true

    config.generators do |g|
        g.test_frame_work :rspec,
            fixtures: true,
            view_specs: false,
            helper_sepcs: false,
            routing_specs: false,
            controller_specs: true,
            request_specs: false
        g.fixture_replacement :fatory_girl, dir: "spec/factories"
    end
  end
end
