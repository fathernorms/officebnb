// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
import { initMapbox } from "../plugins/init_mapbox"
import "../controllers/index"
import { initOpenModal } from "../plugins/init_openmodal"
import { init_display_action } from "../plugins/init_display_action"
import { init_host_mode } from "../plugins/init_host_mode"
import { init_booking_form_val } from "../plugins/init_booking_form_val"
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  initMapbox();
  // initOpenModal();
  init_display_action();
  init_host_mode();
  init_booking_form_val();
});
