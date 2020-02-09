# foreman plugins import this file therefore __FILE__ cannot be used
FOREMAN_GEMFILE = __FILE__ unless defined? FOREMAN_GEMFILE

require_relative 'config/boot_settings'

source 'https://rubygems.org'

case SETTINGS[:rails]
when '5.2'
  gem 'rails', '5.2.1'
else
  raise "Unsupported Ruby on Rails version configured in settings.yaml: #{SETTINGS[:rails]}"
end

gem 'rest-client', '>= 2.0.0', '< 3', :require => 'rest_client'
gem 'audited', '>= 4.7.1', '< 4.9.0'
gem 'will_paginate', '~> 3.0'
gem 'ancestry', '>= 2.0', '< 4'
gem 'scoped_search', '>= 4.1.3', '< 4.1.7'
gem 'ldap_fluff', '>= 0.4.7', '< 1.0'
gem 'apipie-rails', '>= 0.5.2', '< 0.6.0'
gem 'rabl', '~> 0.11'
gem 'oauth', '>= 0.5.4', '< 1'
gem 'deep_cloneable', '>= 2.3.2', '< 3.0'
gem 'validates_lengths_from_database', '~> 0.5'
gem 'friendly_id', '>= 5.2.4', '< 6'
gem 'secure_headers', '~> 6.0'
gem 'safemode', '>= 1.3.5', '< 2'
if RUBY_VERSION < '2.4'
  gem 'sexp_processor', '< 4.14'
end
gem 'fast_gettext', '~> 1.4'
gem 'gettext_i18n_rails', '~> 1.0'
gem 'rails-i18n', '~> 5.0'
gem 'i18n', '< 1.1'
gem 'turbolinks', '>= 2.5.4', '< 3'
gem 'logging', '>= 1.8.0', '< 3.0.0'
gem 'fog-core', '1.45.0'
gem 'net-scp'
gem 'net-ssh'
gem 'net-ldap', '>= 0.8.0'
gem 'net-ping', :require => false
gem 'activerecord-session_store', '>= 1.1.0', '< 2'
gem 'sprockets', '~> 3'
gem 'sprockets-rails', '~> 3.0'
gem 'record_tag_helper', '~> 1.0'
gem 'responders', '~> 2.0'
gem 'roadie-rails', '~> 1.1'
gem 'x-editable-rails', '~> 1.5.5'
gem 'deacon', '~> 1.0'
gem 'webpack-rails', '~> 0.9.8'
gem 'mail', '~> 2.7'
gem 'sshkey', '~> 1.9'
gem 'dynflow', '>= 1.0.0', '< 2.0.0'
gem 'daemons'
gem 'get_process_mem'

Dir["#{File.dirname(FOREMAN_GEMFILE)}/bundler.d/*.rb"].each do |bundle|
  self.instance_eval(Bundler.read_file(bundle))
end
