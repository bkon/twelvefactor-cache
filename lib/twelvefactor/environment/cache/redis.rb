# frozen_string_literal: true
require "uri"

class Twelvefactor::Environment::Cache::Redis
  def self.apply app, cache_url
    config = app.config

    config.cache_store = [
      :redis_store,
      cache_base_url(cache_url).to_s,
      options(cache_url.query)
    ]
  end

  def self.cache_base_url url
    base = url.dup
    base.query = nil
    base
  end

  def self.options query
    normalize_types raw_options query
  end

  def self.normalize_types options
    normalized = {}

    if options.key? :expires_in
      normalized[:expires_in] = options[:expires_in].to_i
    end

    if options.key? :compress
      normalized[:compress] = options[:compress] == "true"
    end

    options.merge normalized
  end

  def self.raw_options query
    return {} unless query

    CGI
      .parse(query)
      .map { |k, val| [k.to_sym, val.first] }
      .to_h
  end
end
