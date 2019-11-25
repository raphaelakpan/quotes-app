require "rails_helper"

describe Quote do
  let(:quote) { build(:quote, content: nil, author: nil) }

  describe "validations" do
    it "validates presence and length of content" do
      expect(quote.valid?).to be false
      expect(quote.errors[:content]).to eq ["can't be blank", "is too short (minimum is 3 characters)"]

      quote.content = "a" * 1001
      expect(quote.valid?).to be false
      expect(quote.errors[:content]).to eq ["is too long (maximum is 1000 characters)"]
    end

    it "validates presence author" do
      quote.content = "abcdef"
      expect(quote.valid?).to be false
      expect(quote.errors[:author]).to eq ["must exist", "can't be blank"]
    end

    context "when fields are valid" do
      it "passes validation" do
        quote.content = "abcdef"
        quote.author = build(:author)
        expect(quote.valid?).to be true
      end
    end
  end

  describe "callbacks" do
    context "before saving quote" do
      let(:content) { "hello world" }

      context "and content already exists" do
        let!(:quote) { create(:quote, content: content) }

        it "fails validation" do
          new_quote = build(:quote, content: content)

          expect { new_quote.save! }
            .to raise_exception(ActiveRecord::RecordInvalid, /Content already exists/)
        end
      end

      context "and content does not already exists" do
        let!(:quote) { create(:quote, content: content) }

        it "does not fail validation" do
          new_quote = build(:quote, content: "hello code")

          expect { new_quote.save! }.not_to raise_exception
        end
      end
    end
  end
end
