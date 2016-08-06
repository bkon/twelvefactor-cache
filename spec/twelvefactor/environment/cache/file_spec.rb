require "ostruct"

RSpec.describe Twelvefactor::Environment::Cache::File do
  let(:config) { OpenStruct.new }
  let(:app) { double("App", config: config) }
  let(:url) { "file:///tmp/cache?namespace=test" }

  let(:action) { described_class.apply app, URI(url) }

  describe "cache store" do
    subject do
      action
      config.cache_store
    end

    it { should eq [:file_store, "/tmp/cache", { namespace: "test" } ] }
  end
end
