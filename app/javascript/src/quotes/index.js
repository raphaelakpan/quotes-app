$(document).ready(() => {
  const addQuoteButton = $('.quotes__add_button');
  const addQuoteModal = $('.add_quote_modal');
  const addQuoteModalOverlay = $('.add_quote_modal__overlay');
  const closeQuoteModalButton = $('.modal__close_button');

  const appBarClearSearchIcon = $('.appbar__clear_search_icon');

  const toggleAddQuoteModal = () => {
    addQuoteModal.toggleClass('show');
  }

  addQuoteButton.click(toggleAddQuoteModal);
  closeQuoteModalButton.click(toggleAddQuoteModal);
  addQuoteModalOverlay.click(toggleAddQuoteModal);

  appBarClearSearchIcon.click(() => document.location = '/')
})

