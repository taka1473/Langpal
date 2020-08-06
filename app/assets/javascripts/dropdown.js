$(document).on('turbolinks:load', function(){
  jQuery('.user-info').hover(
    function(){
      jQuery(this).find('.user-intro').stop().slideDown(600);
      jQuery(this).css('border-left', ' solid 4px #FF7754');
  }, function(){
      jQuery(this).find('.user-intro').stop().slideUp(600);
      jQuery(this).css('border-left', ' solid 4px #ddd');
  });
});

$(document).ready( function(){
  jQuery('.user-info').hover(
    function(){
      jQuery(this).find('.user-intro').stop().slideDown(600);
      jQuery(this).css('border-left', ' solid 4px #FF7754');
  }, function(){
      jQuery(this).find('.user-intro').stop().slideUp(600) ;
      jQuery(this).css('border-left', 'solid 4px #ddd');
  });
});


$(document).on('turbolinks:load', function() {
   $('#new-room-btn').click(function(){
    $('#form-wrapper').fadeIn();
  });
  $('.close-btn').click(function(){
    $('#form-wrapper').fadeOut();
  });
});

$(document).ready(function(){
  $('#new-room-btn').click(function(){
    $('#form-wrapper').fadeIn();
  });
  $('.close-btn').click(function(){
    $('#form-wrapper').fadeOut();
  });
});