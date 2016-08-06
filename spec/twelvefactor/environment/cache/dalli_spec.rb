require "ostruct"

RSpec.describe Twelvefactor::Environment::Cache::Dalli do
  let(:config) { OpenStruct.new }
  let(:app) { double("App", config: config) }
  let(:url) { "dalli://first.server,second.server?namespace=test" }

  let(:action) { described_class.apply app, URI(url) }

  describe "cache store" do
    subject do
      action
      config.cache_store
    end

    let(:expected_config) do
      [:dalli_store, ["first.server", "second.server"], { namespace: "test" }]
    end

    it { should eq expected_config }
  end
end
