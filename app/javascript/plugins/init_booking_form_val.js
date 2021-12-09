const init_booking_form_val = () => {
  var start = $("#booking_start_date");
  var end = $("#booking_end_date");
  var guests = $("#booking_guests");
  var cost = $("#booking_cost");
  var price = $("#list-price").data("price");

  start.change(() => {
    if (end.val() < start.val()) {
      end.val(start.val());
    }
    end.attr({ min: start.val() });
  });

  $("#new_booking").on(
    "keyup change paste",
    "input, select, textarea",
    function () {
      if (start.val() === end.val()) {
        cost.val((price * guests.val()).toFixed(2));
      } else {
        var diff = Math.floor(
          (Date.parse(end.val()) - Date.parse(start.val())) / 86400000
        );
        cost.val((diff * guests.val() * price).toFixed(2));
      }
    }
  );
};

export { init_booking_form_val };
