require "ostruct"

RSpec.describe Twelvefactor::Environment::Cache::Null do
  let(:config) { OpenStruct.new }
  let(:app) { double("App", config: config) }
  let(:url) { "null://localhost" }

  let(:action) { described_class.apply app, URI(url) }

  describe "cache store" do
    subject do
      action
      config.cache_store
    end

    it { should eq :null_store }
  end
end
