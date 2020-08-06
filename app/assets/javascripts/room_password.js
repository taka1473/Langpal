$(document).on('turbolinks:load', function(){
  $('.room').click(function(){
    var room = $(this).attr('data-room')
    var password = $(this).attr('data-password')
    var bool = $(this).attr('data-bool')
    
    if (password == 'any' && bool != 'true'){
      $('#password-wrapper').fadeIn()
      $('.close-btn').click(function(){
        $('#password-wrapper').fadeOut();
      })
      $("#password-submit-btn").click(function(){
        window.location.href = "rooms/"+room+"?input="+$('#password-input').val();
      });
    }else{
      window.location.href = "/rooms/"+room;
    }});
});

$(document).ready( function(){
  $('.room').click(function(){
    var room = $(this).attr('data-room')
    var password = $(this).attr('data-password')
    var bool = $(this).attr('data-bool')
    
    if (password == 'any' && bool != 'true'){
      $('#password-wrapper').fadeIn()
      $('.close-btn').click(function(){
        $('#password-wrapper').fadeOut();
      })
      $("#password-submit-btn").click(function(){
        window.location.href = "rooms/"+room+"?input="+$('#password-input').val();
      });
    }else{
      window.location.href = "/rooms/"+room;
    }});
});
