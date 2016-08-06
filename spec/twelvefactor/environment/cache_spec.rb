RSpec.describe Twelvefactor::Environment::Cache do
  let(:app) { double("APP") }

  describe ".apply" do
    subject do
      described_class.apply app, url
    end

    context "when URL has a known schema" do
      let(:url) do
        URI("file:///tmp/cache")
      end

      it "delegates to a schema handler" do
        expect(Twelvefactor::Environment::Cache::File)
          .to receive(:apply).with(app, url)

        subject
      end
    end

    context "when URL schema is not known" do
      let(:url) do
        URI("foo://server")
      end

      it "falls back to the null cache" do
        expect(Twelvefactor::Environment::Cache::Null)
          .to receive(:apply).with(app, url)

        subject
      end
    end
  end
end
