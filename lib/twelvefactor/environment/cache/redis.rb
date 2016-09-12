# frozen_string_literal: true
class Twelvefactor::Environment::Cache::Redis
  def self.apply app, cache_url
    config = app.config

    config.cache_store = :redis_store, cache_url.to_s
  end
end
