require_relative 'boot'

require 'rails/all'
require 'jp_prefecture'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FreemarketSample63c
  class Application < Rails::Application
    config.i18n.default_locale = :ja
    config.action_view.field_error_proc = Proc.new do |html_tag, instance|
      %Q(#{html_tag}).html_safe
    end
  end
end
