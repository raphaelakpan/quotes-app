$(document).ready(() => AddQuoteForm.init());

class AddQuoteForm {
  static init() {
    this.form = $('.add_quote_modal form');
    this.contentInput = $('.quote__content_input');
    this.authorInput = $('.quote__author_input');
    this.submitButton = $('.quote__author_input');
    this.errorElement = $('.quote__error');

    this.form.submit(this.handleSubmit);
  }

  static handleSubmit = event => {
    event.preventDefault();

    const content = this.contentInput.val().trim();
    const author = this.authorInput.val().trim();

    if (!content || !author) {
      this.errorElement.text('Please enter values for fields');
      this.errorElement.show();
      return;
    } else {
      this.errorElement.hide();
    }

    this.save({ content, author });
  }

  static save = quote => {
    $.ajax({
      url: '/quotes',
      method: 'post',
      data: { quote },
      success: () => {
        this.errorElement.hide();
        document.location.reload();
        $('.modal__close_button').trigger('click');
      },
      error: ({ responseJSON }) => {
        if (!responseJSON) return;
        this.errorElement.text(responseJSON.error.join('.\n'));
        this.errorElement.show();
      }
    });
  }
}
