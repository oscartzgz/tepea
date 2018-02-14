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

  document.getElementById('photo_photo').addEventListener('change', (e) => {
    const file = e.target.files[0];
    if (!file) {
      return;
    }

    readURL(this, file);

    new ImageCompressor(file, {
      maxWidth: 1200,
      maxHeight: 1000,
      quality: .7,
      success(result) {
        var formData = new FormData();
        var description = $('#photo_description').val();
        formData.append('photo[description]', description);
        formData.append('photo[photo]', result);
        console.log(formData);

        alert('Aqui vamos!!!')
        $.ajax({
          type: "POST",
          url: "/fotos",
          data: formData,
          processData: false,
          contentType: false,
          success: function(){
            console.log('Succesfull reponse from server.');
          },
          error: function(e){
            console.log(e);
          }
        });

      }
    });
  })


});


function readURL(input, file){
  var reader = new FileReader();
  reader.onload = function(e) {
    $('#preview').attr("src", e.target.result);
  }
  reader.readAsDataURL(file);
}