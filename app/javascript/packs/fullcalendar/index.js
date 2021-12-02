import { Calendar } from "@fullcalendar/core";
import dayGridPlugin from "@fullcalendar/daygrid";
import timeGridPlugin from "@fullcalendar/timegrid";
import listPlugin from "@fullcalendar/list";
import interactionPlugin from "@fullcalendar/interaction";
// import tippy from "tippy.js";
// import "tippy.js/dist/tippy.css";
import "./style.css";

document.addEventListener("DOMContentLoaded", function () {
  var calendarEl = document.getElementById("calendar");
  var dateSelectLabel = document.getElementById("date-select-label");

  var calendar = new Calendar(calendarEl, {
    plugins: [interactionPlugin, dayGridPlugin, timeGridPlugin, listPlugin],
    headerToolbar: {
      left: "prev,next",
      center: "title",
      right: "dayGridMonth",
    },
    fixedWeekCount: false,
    navLinks: true, // can click day/week names to navigate views
    editable: true,
    dayMaxEvents: true, // allow "more" link when too many events

    events: [],
    dateClick: function (info) {
      // console.log(info.dayEl);
    },
  });

  calendar.on("dateClick", function (info) {
    // console.log("clicked on " + info.dateStr);
  });

  calendar.render();

  function changeDateLabel() {
    var text = dateSelectLabel.innerText;
    if (text === "Please select a start date:") {
      dateSelectLabel.innerText = "Please select an end date:";
    } else {
      dateSelectLabel.innerText = "Please select a start date:";
    }
  }

  var selectedDates = [];

  var grids = document.querySelectorAll('[role="gridcell"]');
  grids.forEach((grid) => {
    grid.addEventListener("click", event => {
      changeDateLabel();
      console.log(event.target.style);
      if (selectedDates.length == 2){
        selectedDates.forEach(date => {
          date.style.backgroundColor = "#f4f4f4";
        });
        selectedDates = []
        event.target.style.backgroundColor = "pink";
        selectedDates.push(event.target);
      } else {
          event.target.style.backgroundColor = "pink";
          selectedDates.push(event.target)
      }
    });
  })
});
