$(document).on('turbolinks: load', function(){
    $('#question-btn').click(function(){
        if ($('#response').hasClass(('show'))){
            $('#response').fadeOut().removeClass('show')
            $(this).text('?')
        }else{
            $('#response').fadeIn().addClass('show')
            $(this).text('x')
        }
    })
})

$(document).ready(function(){
    $('#question-btn').click(function(){
        if ($('#response').hasClass(('show'))){
            $('#response').fadeOut().removeClass('show')
            $(this).text('?')
        }else{
            $('#response').fadeIn().addClass('show')
            $(this).text('x')
        }
    })
})