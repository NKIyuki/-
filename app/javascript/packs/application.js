// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery";
import "popper.js";
import "bootstrap";
import "../stylesheets/application"
import '@fortawesome/fontawesome-free/js/all'
//import '@fortawesome/fontawesome-free/js/all'
const images = require.context('../images', true)
const imagePath = (name) => images(name, true)
Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("jquery")

$(function() {
  $('#back a').on('click',function(event){
    $('body, html').animate({
      scrollTop:0
    }, 800);
    event.preventDefault();
  });
});

$(function(){
  setTimeout("$('.notice').fadeOut('slow')", 2000);
});
$(function(){
  setTimeout("$('.alert').fadeOut('slow')", 2000);
});