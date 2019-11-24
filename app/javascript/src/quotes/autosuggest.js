$(document).ready(() => {
  // Appbar search input author autosuggest
  const searchInput = $('.appbar__search_input');
  const searchInputAutosuggest = $('.search_input__autosuggest');
  const searchInputForm = $('.appbar__search');
  new AuthorAutoSuggest(searchInput, searchInputAutosuggest, () => searchInputForm.submit())

  // Add Quote modal author input autosuggest
  const addQuoteAuthorInput = $('.quote__author_input');
  const addQuoteAuthorAutosuggest = $('.add_quote__autosuggest');
  new AuthorAutoSuggest(addQuoteAuthorInput, addQuoteAuthorAutosuggest);
});

class AuthorAutoSuggest {
  constructor(inputElement, autosuggest, optionSelectedCallback = () => {}) {
    this.inputElement = inputElement;
    this.autosuggest = autosuggest;
    this.optionSelectedCallback = optionSelectedCallback;

    this.inputElement.keyup(Utility.debounce(this.fetchAuthors, 500));
    this.inputElement.focusin(this.fetchAuthors);
    this.inputElement.focusout(() => {
      // If the user clicks on an option, this input loses focus too.
      // A little wait allows us to capture the click event.
      setTimeout(() => this.autosuggest.hide(), 200);
    });

    this.autosuggest.click(this.optionSelected);
  }

  fetchAuthors = () => {
    const query = this.inputElement.val().trim();

    if (query) {
      $.ajax({
        url: `/authors?query=${query}`,
        method: 'get',
        success: data => {
          // show fetched data in autosugggest dropdown
          const authorElements = data.map(author => {
            return `<div class="autosuggest__item">${author.name}</div>`;
          });
          this.autosuggest.html(authorElements);
          this.autosuggest.show();
        }
      });
    }
  }

  optionSelected = event => {
    const selectedOption = event.target.innerText;
    this.inputElement.val(selectedOption);
    this.autosuggest.hide();
    this.optionSelectedCallback();
  }
}

class Utility {
  static debounce = (func, timer) => {
    let timerId = null;

    return (...args) => {
      if (timerId) {
        clearTimeout(timerId);
      }

      timerId = setTimeout(() => {
        func(...args);
      }, timer);
    };
  }
}
