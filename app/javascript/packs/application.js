/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import ImageCompressor from 'image-compressor.js';



document.addEventListener("DOMContentLoaded", function(event) {

  var photo_selected = false;
  var input_file = document.getElementById('photo_photo');
  var send_button = document.getElementById('sendPhoto');


  if(input_file){

    send_button.addEventListener('click', (e) => {
      e.preventDefault();
      console.log('uploadPhoto va a ser ejecutada');
      uploadPhoto(input_file);
    });

    // Render preview image
    input_file.addEventListener('change', (e) => {
      const file = e.target.files[0];
      if (!file) {
        photo_selected = false;
        return;
      }
      photo_selected = true;
      $('#progressBarContainer').addClass('hide');
      $('#progressMessage').text("");
      readURL(this, file);
    })
  }
});


function readURL(input, file){
  var reader = new FileReader();
  reader.onload = function(e) {
    $('#preview').attr("src", e.target.result);
  }
  reader.readAsDataURL(file);
}

function uploadPhoto(e){
  const file = e.files[0];
  if (!file) {
    return;
  }

  console.log('Comprimiendo imagen');

  new ImageCompressor(file, {
    maxWidth: 1080,
    maxHeight: 960,
    quality: .7,
    success(result) {
      var formData = new FormData();
      var description = $('#photo_description').val();
      formData.append('photo[description]', description);
      formData.append('photo[photo]', result, result.name);

      console.log('Compresion exitosa, enviando por ajax')
      $.ajax({
        beforeSend: function(request){
              $('#progressBarContainer').removeClass('hide');
        },
        type: "POST",
        url: "/fotos",
        data: formData,
        processData: false,
        contentType: false,
        success: function(data){
          $('#progressBarContainer').addClass('hide');
          window.location = data.url.replace('.json', '')
        },
        error: function(e){
          console.log(e);
          $('#progressMessage').text("Ocurrio un error, por favor intenta de nuevo.")
        }

      });

    }
  });
}