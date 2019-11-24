$(document).ready(() => {
  InfiniteScroll.init();

  $(document).scroll(() => {
    const hasReachedBottom = $(document).height() - $(window).height() == $(window).scrollTop();
    if (hasReachedBottom) {
      InfiniteScroll.loadMoreQuotes();
    }
  });
})

class InfiniteScroll {
  static init = () => {
    this.limit = 10;
    this.offset = 10;
    this.hasData = true;

    this.quotesContainer = $('.quotes__container');
    this.quoteElement = $('.quotes__quote').first();
  }

  static loadMoreQuotes = () => {
    if (!this.hasData) return;

    $.ajax({
      url: `/?limit=${this.limit}&offset=${this.offset}`,
      method: 'get',
      dataType: 'json',
      success: (data) => {
        if (data.length === 0) {
          this.hasData = false;
          return;
        }

        this.offset += this.limit;
        this.populatePage(data);
      }
    })
  }

  static populatePage = quotes => {
    const quoteElements = quotes.map(quote => {
      const quoteElement = this.quoteElement.clone();
      quoteElement.children('.quote__content').text(quote.content)
      quoteElement.children('.quote__author').text(`- ${quote.author.name}`)
      return quoteElement;
    });

    this.quotesContainer.append(quoteElements);
  }
}
