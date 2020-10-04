$( document ).on('turbolinks:load', function() {
  $( "#like" ).click(function() {
    giveLike();
  });
  function giveLike() {
    console.log("EL CLICK FUNCIONA");
    $.ajax({
      type: "POST",
      url: url,
      data: data,
      beforeSend: function (xhr) {
        xhr.setRequestHeader('Authorization', 'Bearer t-7614f875-8423-4f20-a674-d7cf3096290e');
      },
      success: function(data){

      }
    });
  }
});
