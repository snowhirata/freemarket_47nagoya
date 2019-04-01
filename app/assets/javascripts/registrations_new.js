
$(function(){
  $(document).ready(function() {
    $('#second-form').hide();
    $('#third-form').hide();
  });

  $('#ivent-button1').click(function(){
    $('#first-form').hide();
    $('#second-form').show();
  })

  $('#ivent-button2').click(function(){
    $('#second-form').hide();
    $('#third-form').show();
  })
})
