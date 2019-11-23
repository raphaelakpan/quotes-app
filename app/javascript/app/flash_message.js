$(document).ready(() => {
  const flashMessage = $('.flash');
  if (!flashMessage) return;

  // hide flash message after 5 seconds
  const timer = setTimeout(() => {
    flashMessage.hide();
  }, 5000);

  const cancelButton = $('.flash__close_button')
  // hide flash message if triggered by user
  cancelButton.click(() => {
    clearTimeout(timer);
    flashMessage.hide();
  })
})
