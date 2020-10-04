// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require activestorage
//= require turbolinks
//= require jquery
//= require rails-ujs
//= require turbolinks
//= require bootstrap
//= require_tree .
$( document ).on('turbolinks:load', function() {
  $( "#like" ).click(function() {

    giveLike();

  });
  function giveLike() {
    var url = 'https://api.unsplash.com/photos/'+ image_id+'/like'
    console.log(url);
    var bearer_token = 'Bearer '+ token
    $.ajax({
      type: "POST",
      url: url,
      data: {},
      beforeSend: function (xhr) {
        xhr.setRequestHeader('Authorization', bearer_token);
      },
      success: function(data){
        alert("TE GUSTA ESTA IMAGEN");

      }
    });
  }
});
