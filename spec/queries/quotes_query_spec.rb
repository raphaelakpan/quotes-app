require "rails_helper"

describe QuotesQuery do
  describe "limit" do
    let!(:existing_quotes) { create_list(:quote, 15) }

    context "when present" do
      it "uses the provided limit to fetch quotes" do
        quoutes = described_class.new(limit: 5).quotes
        expect(quoutes.size).to eq 5
      end

    end

    context "when not present" do
      it "use default limit of 10 to fetch quotes" do
        quoutes = described_class.new.quotes
        expect(quoutes.size).to eq 10
      end

    end
  end

  describe "offset" do
    let!(:existing_quotes) { create_list(:quote, 15) }

    context "when present" do
      it "uses the provided offset to fetch quotes" do
        quotes = described_class.new(offset: 5).quotes

        # returns the remaining latest 10 after skipping the first latest 5
        expect(quotes.size).to eq 10
        expect(quotes[0]).to eq existing_quotes[9]
        expect(quotes[9]).to eq existing_quotes[0]
      end
    end

    context "when not present" do
      it "uses default offset of 0 to fetch quotes" do
        quotes = described_class.new.quotes

        # returns the latest 10 quotes without skipping
        expect(quotes.size).to eq 10
        expect(quotes[0]).to eq existing_quotes[14]
        expect(quotes[9]).to eq existing_quotes[5]
      end
    end
  end

  describe "#query" do
    let!(:author_1) { create(:author, name: "James Blunt") }
    let!(:author_2) { create(:author, name: "Jordin Sparks") }
    let!(:author_3) { create(:author, name: "Justin Bieber") }
    let!(:quote_1) { create(:quote, author: author_1, content: "Your Hero") }
    let!(:quote_2) { create(:quote, author: author_2, content: "No air") }
    let!(:quote_3) { create(:quote, author: author_3, content: "I'm Sorry") }

    context "when not present" do
      it "returns quotes without filtering" do
        quotes = described_class.new.quotes
        expect(quotes.size).to eq 3
      end
    end

    context "when present" do
      it "returns quotes where author or content match query" do
        quotes = described_class.new(query: "or").quotes
        expect(quotes.size).to eq 2
        expect(quotes[0]).to eq quote_3 # matches "or" in "Sorry" => content
        expect(quotes[1]).to eq quote_2 # matchs "or" in "Jordin" => author
      end
    end
  end
end
