require "rails_helper"

describe AuthorSerializer do
  describe "#as_json" do
    let!(:author) { create(:author) }

    it "serializes the author" do
      expect(described_class.new(author).as_json).to eq(
        name: author.name
      )
    end
  end
end
