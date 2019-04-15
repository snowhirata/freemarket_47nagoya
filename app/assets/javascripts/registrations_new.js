$(function(){ 
  var url = location.href;
  if (url == "http://localhost:3000/uservalids/new") {
    $('#step1').addClass('active');
  }
  if (url == "http://localhost:3000/uservalids") {
    $('#step1').addClass('active');
  }
  if (url == "http://localhost:3000/addressvalids/new") {
    $('#step1').removeClass('active');
    $('#step3').addClass('active');
  }
  if (url == "http://localhost:3000/addressvalids") {
    $('#step1').removeClass('active');
    $('#step3').addClass('active');
  }
  if (url == "http://localhost:3000/creditvalids/new") {
    $('#step3').removeClass('active');
    $('#step4').addClass('active');
  }
  if (url == "http://localhost:3000/creditvalids") {
    $('#step3').removeClass('active');
    $('#step4').addClass('active');
  }
  if (url == "http://localhost:3000/complete") {
    $('#step4').removeClass('active');
    $('#step5').addClass('active');
  }


  if (url == "https://mercari47nagoya.tk/uservalids/new") {
    $('#step1').addClass('active');
  }
  if (url == "https://mercari47nagoya.tk/uservalids") {
    $('#step1').addClass('active');
  }
  if (url == "https://mercari47nagoya.tk/addressvalids/new") {
    $('#step1').removeClass('active');
    $('#step3').addClass('active');
  }
  if (url == "https://mercari47nagoya.tk/addressvalids") {
    $('#step1').removeClass('active');
    $('#step3').addClass('active');
  }
  if (url == "https://mercari47nagoya.tk/creditvalids/new") {
    $('#step3').removeClass('active');
    $('#step4').addClass('active');
  }
  if (url == "https://mercari47nagoya.tk/creditvalids") {
    $('#step3').removeClass('active');
    $('#step4').addClass('active');
  }
  if (url == "https://mercari47nagoya.tk/complete") {
    $('#step4').removeClass('active');
    $('#step5').addClass('active');
  }
});

