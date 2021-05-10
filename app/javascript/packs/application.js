// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

//= require data-confirm-modal
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import Rails from "@rails/ujs"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

window.onload = () => {

  class Confirm {
    constructor(el) {
      this.message = el.getAttribute('data-confirm')
      if (this.message) {
        el.form.addEventListener('submit', this.confirm.bind(this))
      } else {
        console && console.warn('No value specified in `data-confirm`', el)
      }
    }

    confirm(e) {
      if (!window.confirm(this.message)) {
        e.preventDefault();
      }
    }
  }

  Array.from(document.querySelectorAll('[data-confirm]')).forEach((el) => {
    new Confirm(el)
  })

  }