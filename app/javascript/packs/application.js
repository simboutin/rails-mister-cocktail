// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import 'bootstrap';
import { initUpdateNavbarOnScroll } from '../components/navbar';
import { selectRating } from '../components/rating';
import { initSelect2 } from '../plugins/init_select2';
import { initSweetalert } from '../plugins/init_sweetalert';

Rails.start()
Turbolinks.start()
ActiveStorage.start()

document.addEventListener('turbolinks:load', () => {
  // Call your JS functions here
  initUpdateNavbarOnScroll();
  selectRating();
  initSelect2();
  initSweetalert('.btn-delete', {
    title: 'Are you sure?',
    text: "The ingredient will be permanently deleted !",
    icon: 'warning',
    buttons: {
      cancel: true,
      confirm: true,
    },
  });
});
