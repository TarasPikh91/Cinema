$(document).ready(function () {

    $("#registration-form").css("display", "none");

    $("#logIn").click(function(){
        $("#registration-form").toggle();
    });
});