# frozen_string_literal: true
class Twelvefactor::Environment::Cache::File
  def self.apply app, cache_url
    config = app.config
    config.cache_store = :file_store, cache_url.path, options(cache_url.query)
  end

  def self.options query
    return {} unless query

    CGI
      .parse(query)
      .map { |k, val| [k.to_sym, val.first] }
      .to_h
  end
end
