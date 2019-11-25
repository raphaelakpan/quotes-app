require "rails_helper"

describe "Home Page", driver: :selenium_chrome_headless do
  context "when viewing home page" do
    let!(:quotes) { create_list(:quote, 15) }

    it "displays latest 10 quotes" do
      visit root_path

      expect(page).to have_content("Quotes")
      expect(page).to have_css('.quotes__quote', count: 10)
      expect(page).to have_content(quotes[14].author.name.upcase)  # first of latest 10 quotes
      expect(page).to have_content(quotes[5].content) # end of latest 10 quotes
      expect(page).not_to have_content(quotes[4].content) # not fetched yet
    end

    context "when user scrolls to end of page" do
      it "loads more quotes" do
        visit root_path

        expect(page).to have_css(".quotes__quote", count: 10)

        page.execute_script("window.scrollTo(0,100000)") # scroll to end of page

        expect(page).to have_css(".quotes__quote", count: quotes.size)
        expect(page).to have_content(quotes[14].author.name.upcase)
        expect(page).to have_content(quotes[5].content)
        expect(page).to have_content(quotes[0].content)
      end
    end
  end

  context "when creating quote" do
    let(:content) { "Awesome Quote" }
    let(:author) { "James Bond" }

    it "creates the quote and displays it" do
      visit root_path

      # open modal
      find(".quotes__add_button").click

      # fill in content and author
      find(".quote__content_input").set(content)
      find(".quote__author_input").set(author)

      # submit
      click_on "Add now"

      expect(page).to have_content("Quote created successfully")
      expect(page).to have_content(content)
      expect(page).to have_content(author.upcase)
    end

    context "when typing author name" do
      let!(:author_1) { create(:author, name: "Jones") }
      let!(:author_2) { create(:author, name: "Jon") }
      let!(:author_3) { create(:author, name: "Jane") }

      it "autosuggests authors that match name" do
        visit root_path

        find(".quotes__add_button").click

        find(".quote__author_input").set("jo")

        expect(page).to have_css(".autosuggest.add_quote__autosuggest")
        expect(page).to have_content(author_1.name)
        expect(page).to have_content(author_2.name)
        expect(page).not_to have_content(author_3.name)
      end
    end

    context "and error occurs" do
      let(:content) { "ab" } # short content

      it "displays the error message and does not create quote" do
        visit root_path

        find(".quotes__add_button").click

        find(".quote__content_input").set(content)
        find(".quote__author_input").set(author)

        click_on "Add now"

        expect(page).to have_content("Content is too short (minimum is 3 characters)")
        expect(page).not_to have_content("Quote created successfully")
        expect(page).not_to have_content(content)
        expect(page).not_to have_content(author.upcase)
      end
    end
  end

  context "when searching" do
    let(:query) { "out" }
    let(:author_1) { create(:author, name: "Brian Tracy") }
    let(:author_2) { create(:author, name: "Stephen Covey") }
    let!(:quote_1) { create(:quote, content: "about this", author: author_1) }
    let!(:quote_2) { create(:quote, content: "7 habits", author: author_2) }

    context "when typing in search field" do
      it "autosuggests authors that match search query" do
        visit root_path

        find(".appbar__search_input").set("br")

        expect(page).to have_css(".autosuggest.search_input__autosuggest")
        expect(page).to have_content(author_1.name)
        expect(page).not_to have_content(author_2.name)
      end
    end

    context "and query matches content" do
      it "returns matching quotes" do
        visit root_path

        search_input = find(".appbar__search_input")

        search_input.set(query)
        search_input.native.send_keys(:return) # submits form

        expect(page).to have_content("Showing search results for \"#{query}\"")
        expect(page).to have_content(quote_1.content)
        expect(page).to have_content(author_1.name.upcase)
        expect(page).not_to have_content(quote_2.content)
        expect(page).not_to have_content(author_2.name.upcase)
      end
    end

    context "and query matches author" do
      let(:query) { "cove" }

      it "returns matching quotes" do
        visit root_path

        search_input = find(".appbar__search_input")

        search_input.set(query)
        search_input.native.send_keys(:return) # submits form

        expect(page).to have_content("Showing search results for \"#{query}\"")
        expect(page).to have_content(quote_2.content)
        expect(page).to have_content(author_2.name.upcase)
        expect(page).not_to have_content(quote_1.content)
        expect(page).not_to have_content(author_1.name.upcase)
      end
    end

    context "and query matches contents and author" do
      let(:query) { "ab" }

      it "returns matching quotes" do
        visit root_path

        search_input = find(".appbar__search_input")

        search_input.set(query)
        search_input.native.send_keys(:return) # submits form

        expect(page).to have_content("Showing search results for \"#{query}\"")
        expect(page).to have_content(quote_1.content)
        expect(page).to have_content(author_1.name.upcase)
        expect(page).to have_content(quote_2.content)
        expect(page).to have_content(author_2.name.upcase)
      end
    end

    context "when no match is found" do
      let(:query) { "abcdefgh" }

      it "returns no quotes and displays message" do
        visit root_path

        search_input = find(".appbar__search_input")

        search_input.set(query)
        search_input.native.send_keys(:return) # submits form

        expect(page).to have_content("No quotes found")
        expect(page).not_to have_content(quote_1.content)
        expect(page).not_to have_content(author_1.name.upcase)
        expect(page).not_to have_content(quote_2.content)
        expect(page).not_to have_content(author_2.name.upcase)
      end
    end

    context "when user clicks the clear button after searching" do
      it "resets search" do
        visit root_path

        search_input = find(".appbar__search_input")

        search_input.set(query)
        search_input.native.send_keys(:return) # submits form

        expect(page).to have_content("Showing search results for \"#{query}\"")

        find(".appbar__search_clear_button").click

        expect(page).not_to have_content("Showing search results for \"#{query}\"")
      end
    end
  end
end
