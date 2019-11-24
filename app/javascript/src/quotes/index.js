$(document).ready(() => {
  const addQuoteButton = $('.quotes__add_button');
  const addQuoteModal = $('.add_quote_modal');
  const addQuoteModalOverlay = $('.add_quote_modal__overlay');
  const closeQuoteModalButton = $('.modal__close_button');

  const appBarClearSearchButton = $('.appbar__search_clear_button');

  const toggleAddQuoteModal = () => {
    addQuoteModal.toggleClass('show');
  }

  addQuoteButton.click(toggleAddQuoteModal);
  closeQuoteModalButton.click(toggleAddQuoteModal);
  addQuoteModalOverlay.click(toggleAddQuoteModal);

  appBarClearSearchButton.click(() => document.location = '/');
})

