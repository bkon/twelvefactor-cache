require "ostruct"

RSpec.describe Twelvefactor::Environment::Cache::Redis do
  let(:config) { OpenStruct.new }
  let(:app) { double("App", config: config) }
  let(:url) { "redis://localhost:6379/1/cache" }

  let(:action) { described_class.apply app, URI(url) }

  describe "cache store" do
    subject do
      action
      config.cache_store
    end

    it { should eq [:redis_store, url] }
  end
end
