$(document).on('turbolinks:load', function() {
    $('#caution-h').hover(function(){
        $('#caution-container').children('ul').slideDown();
    }, function(){
        $('#caution-container').children('ul').slideUp();
    })
});