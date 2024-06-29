// require jquery
// require jquery_ujs

import { Application } from "@hotwired/stimulus"
import "controllers"

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

// app/javascript/controllers/application.js
import Rails from "@rails/ujs";
Rails.start();

