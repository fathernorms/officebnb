const init_host_mode = () => {
  $(document).ready(function () {
    var host = $("#host-mode").html();

    if (host === "Host") {
      $(".navbar-lewagon").css("backgroundColor", "#cef3db");
      $("#footer").css("backgroundColor", "#cef3db");
    }

    if ($(".host-mode").html() === "Host") {
      $(".navbar-lewagon").css("backgroundColor", "#cef3db");
      $("#footer").css("backgroundColor", "#cef3db");
    }

    if ($(".host-listings").html() === "Listings") {
      $(".navbar-lewagon").css("backgroundColor", "#cef3db");
      $("#footer").css("backgroundColor", "#cef3db");
    }
  });
};

export { init_host_mode };
