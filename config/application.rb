require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MetrogasLecturas
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    #config.time_zone = 'Santiago'
    #config.active_record.default_timezone = :local # Or :utc

    # Set the time zone for the TimeWithZone instance
	Time.zone = 'Santiago'

	# Get current time using the time zone you set
	Time.zone.now

	# Convert from unix timestamp integer to a time instance using the time zone you set
	Time.zone.at(1364046539)

	# - Convert from unix timestamp back to a time instance
	# - Set the time zone to Eastern Time
	# - Change the output string format => "03/23/13 09:48 AM"
	Time.at(1364046539).in_time_zone("Santiago").strftime("%m-%d-%y %I:%M %p")
	# config.assets.paths << Rails.root.join('app', 'assets', 'fonts')

  end
end
