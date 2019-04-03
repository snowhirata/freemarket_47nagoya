$(function(){

  $(document).ready(function() {
    $('#second-form').hide();
    $('#third-form').hide();
    $('#forth-form').hide();
  });

  $('#ivent-button1').click(function(){
    $('#step3').addClass('active')
    $('#step1').removeClass('active')
    $('#first-form').hide();
    $('#second-form').show();
    $('html,body').animate({scrollTop:0}, 1);
  })

  $('#ivent-button2').click(function(){
    $('#step4').addClass('active')
    $('#step3').removeClass('active')
    $('#second-form').hide();
    $('#third-form').show();
    $('html,body').animate({scrollTop:0}, 1);
  })

  $('#ivent-button3').click(function(){
    $('#step5').addClass('active')
    $('#step4').removeClass('active')
    $('#third-form').hide();
    $('#forth-form').show();
    $('html,body').animate({scrollTop:0}, 1);
  })

})