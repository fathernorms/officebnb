const initOpenModal = () => {
  var reviewBtns = document.querySelectorAll(".review-details")
  var modal = document.getElementById("myModal");
  var span = document.getElementsByClassName("close")[0];

  reviewBtns.forEach(b => {
    b.onclick = () => {
      modal.style.display = "block";
    }
  });

  span.onclick = function() {
  modal.style.display = "none";
  };

  window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
  };

}

export { initOpenModal };
