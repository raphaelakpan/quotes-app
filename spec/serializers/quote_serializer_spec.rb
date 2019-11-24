require "rails_helper"

describe QuoteSerializer do
  describe "#as_json" do
    let!(:quote) { create(:quote) }

    it "serializers the qoute" do
      expect(described_class.new(quote).as_json).to eq(
        content: quote.content,
        author: {
          name: quote.author.name
        }
      )
    end
  end
end
