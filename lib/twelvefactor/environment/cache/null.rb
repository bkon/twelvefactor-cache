# frozen_string_literal: true
class Twelvefactor::Environment::Cache::Null
  def self.apply app, _
    config = app.config
    config.cache_store = :null_store
  end
end
