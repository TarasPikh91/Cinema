

$(function () {
   $('#login-form-link').click(function (e) {
      $('#login-form').delay(100).fadeIn(100);
      $('#signup-form').fadeOut(100);
      $('#signup-form-link').removeClass('active');
      $(this).addClass('active');
      e.preventDefault();
   });
    $('#signup-form-link').click(function(e) {
        $("#signup-form").delay(100).fadeIn(100);
        $("#login-form").fadeOut(100);
        $('#login-form-link').removeClass('active');
        $(this).addClass('active');
        e.preventDefault();
    });
});



$(function () {
    $('#logIn').click(function (e) {
        e.preventDefault();
       $('#registration-form').toggle();
    });
});

// $(function () {
//     $('#requestMovie').click(function () {
//         $('#requestMovieForm').toggle();
//         var requestedMovie = {
//             name : $('#movieName').val()
//         };
//
//         $('#movieName').val(' ');
//
//         $.ajax({
//             url: '/requestMovie',
//             method: 'post',
//             dataType: 'json',
//             contentType: 'application/json; charset=UTF-8',
//             data : '',
//             success : function(res){
//                 parseResultFromDb(res)
//             },
//             error: function(err){
//                 conlsole.log(err);
//             }
//         });
//
//     });
// });