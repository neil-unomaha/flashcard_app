// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import 'bootstrap'
import "../stylesheets/application"

document.addEventListener('turbolinks:load', () => {
  $('[data-toggle="tooltip"]').tooltip()
  $('[data-toggle="popover"]').popover()
  $('.toast').toast({ autohide: false })
  $('#toast').toast('show')

  $('#flip-card-btn').on('click', function(){
    $('.card-front-js').removeClass('d-none');
    $('.card-back-js').removeClass('d-none');
  })

  if( $('.appBody').hasClass("cards_tests") ){
    $(document).keyup(function(e){
      if(e.keyCode == 70){
        // f key == flip
        $(".flip-card-js").click();
      }else if(e.keyCode == 67) {
        // c key == correct
        $(".correct-answer-js").click();
      }else if(e.keyCode == 73){
        // i key == incorrect
        $(".incorrect-answer-js").click();
      }
    });
  }

})



Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("trix")
require("@rails/actiontext")
