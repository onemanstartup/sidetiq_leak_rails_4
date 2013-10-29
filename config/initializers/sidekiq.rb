require "active_record/base"

require 'sidekiq'

case Rails.env
when "alpha"
  redis_port = 6391
when "production"
  redis_port = 6392
when "staging"
  redis_port = 6393
else
  redis_port = 6379
end

Sidekiq.configure_client do |config|
  config.redis = { :url => "redis://localhost:#{redis_port}/12" }
end

Sidekiq.configure_server do |config|
  require 'active_record/associations/association_scope'
  config.redis = { :url => "redis://localhost:#{redis_port}/12" }
end
