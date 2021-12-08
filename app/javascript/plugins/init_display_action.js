const init_display_action = () => {
  $('.reservation').mouseenter(function () {
    var bookingId = $(this).data('bookingid');
    $('#' + bookingId).show();
  })

  $(".reservation").mouseleave(function () {
    var bookingId = $(this).data("bookingId");
    $(".baction").hide();
  });
}

export { init_display_action }
