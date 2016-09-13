require "ostruct"

RSpec.describe Twelvefactor::Environment::Cache::Redis do
  let(:config) { OpenStruct.new }
  let(:app) { double("App", config: config) }

  let(:action) { described_class.apply app, URI(url) }

  describe "cache store" do
    subject do
      action
      config.cache_store
    end

    context "when not extra options are present" do
      let(:url) { "redis://localhost:6379/1/cache" }

      let(:expected) do
        [
          :redis_store,
          "redis://localhost:6379/1/cache",
          {}
        ]
      end

      it { should eq expected }
    end

    context "when extra options are present" do
      let(:url) do
        "redis://localhost:6379/1/cache?expires_in=5400&compress=true&foo=bar"
      end

      let(:expected) do
        [
          :redis_store,
          "redis://localhost:6379/1/cache",
          { expires_in: 5400, compress: true, foo: "bar" }
        ]
      end

      it { should eq expected }
    end
  end
end
