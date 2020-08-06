$(document).ready(function(){
  $(window).load(function(){
    $('.alert').hide();
    $('.alert').slideDown();
    window.setTimeout("$('.alert').slideUp('slow')", 3000);
  });
});
