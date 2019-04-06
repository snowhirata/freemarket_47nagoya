$(function(){ 
  var url = location.href;
  
  if (url == "http://localhost:3000/uservalids/new") {
    console.log('yes');
    $('#step1').addClass('active');
  }
  if (url == "http://localhost:3000/uservalids") {
    console.log('yes');
    $('#step1').addClass('active');
  }

  if (url == "http://localhost:3000/addressvalids/new") {
    console.log('yes');
    $('#step1').removeClass('active');
    $('#step3').addClass('active');
  }
  if (url == "http://localhost:3000/addressvalids") {
    console.log('yes');
    $('#step1').removeClass('active');
    $('#step3').addClass('active');
  }


  if (url == "http://localhost:3000/creditvalids/new") {
    console.log('yes');
    $('#step3').removeClass('active');
    $('#step4').addClass('active');
  }
  if (url == "http://localhost:3000/creditvalids") {
    console.log('yes');
    $('#step3').removeClass('active');
    $('#step4').addClass('active');
  }

  if (url == "http://localhost:3000/complete") {
    console.log('yes');
    $('#step4').removeClass('active');
    $('#step5').addClass('active');
  }


});

