require "rails_helper"

describe Author do
  let(:author) { build(:author, name: nil) }

  describe "validations" do
    it "valides the presence of name" do
      expect(author.valid?).to be false
      expect(author.errors[:name]).to eq ["can't be blank"]
    end

    it "valides the uniqueness of name" do
      create(:author, name: "jane")
      author.name = "jane"

      expect(author.valid?).to be false
      expect(author.errors[:name]).to eq ["has already been taken"]
    end

    context "when fields are valid" do
      it "passes validation" do
        author.name = "jane"
        expect(author.valid?).to be true
      end
    end
  end

  describe "::find_or_build_author" do
    let(:name) { "john" }

    context "when author exists with the given name" do
      let!(:existing_author) { create(:author, name: name) }

      it "fetches and returns the existing author" do
        author = Author.find_or_build_author(name)
        expect(author.name).to eq name
        expect(author.new_record?).to be false
        expect(author.id).to eq existing_author.id
      end
    end

    context "when no author exists with the given name" do
      it "builds and returns a new author with the name" do
        author = Author.find_or_build_author(name)
        expect(author.name).to eq name
        expect(author.new_record?).to be true
        expect(author.id).to be nil
      end
    end
  end
end
