// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require tinymce-jquery
//= require materialize-sprockets
//= require_tree .


$(document).ready( function() {
  $(".button-collapse").sideNav();
  $('.datepicker').pickadate({
    selectMonths: true, // Creates a dropdown to control month
    selectYears: 3 // Creates a dropdown of 15 years to control year
  });

  $('#mapShow').click(function(){
    $('#map').show("fast", initMap);
    $('#mapClose').show("fast");
  });

  $("mapClose").click(function(event){
    event.preventDefault();
    $('#map').hide("low");
    $(self).hide("low");
  });

  // Responsive Menu
  $(".button-collapse").sideNav();


  var flashm = $('.flash')[0]
  if (flashm) {
  //   // for ( var i in flashm){
    callout('<i class="material-icons">done</i> ' + ' ' + $(flashm).text())
  //   // } 
  }

});


function callout(message){
  Materialize.toast(message, 8000)
}