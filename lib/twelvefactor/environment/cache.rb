# frozen_string_literal: true

module Twelvefactor; end
module Twelvefactor::Environment; end
class Twelvefactor::Environment::Cache; end

require "twelvefactor/environment/cache/dalli"
require "twelvefactor/environment/cache/file"
require "twelvefactor/environment/cache/null"
require "twelvefactor/environment/cache/redis"

class Twelvefactor::Environment::Cache
  VERSION = "1.0.2".freeze

  HANDLERS = {
    "dalli" => Dalli,
    "file" => File,
    "null" => Null,
    "redis" => Redis
  }.freeze

  def self.apply app, cache_url
    handler = HANDLERS.fetch cache_url.scheme, Null
    handler.apply app, cache_url
  end
end
