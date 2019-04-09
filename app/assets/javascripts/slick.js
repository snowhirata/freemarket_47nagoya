$(document).on('turbolinks:load', function() {
  $('.owl-dots .owl-dot:first-child').addClass('active');
  $('.owl-dots .owl-dot:first-child').css({'opacity':'1','pointer':'default'});

  $('.owl-stage').slick({
    autoplay: false,
    Speed: 3000,
    arrows: false,
    dots: false,
    dotsClass: 'owl-dots',
    pauseOnDotsHover: true,
    infinite: true,
  });
  $('.owl-dot').on('mouseover', function(e){
    var $currTarget = $(e.currentTarget);
    index = $('.owl-dot').index(this);
    slickObj = $('.owl-stage').slick('getSlick');
    slickObj.slickGoTo(index);
  });

  $('.owl-dot').hover(function(){
    $('.active').css({'opacity':'','pointer':''})
    $('.active').removeClass('active');
    $(this).addClass('active');
    $(this).css({'opacity':'1','pointer':'default'});
  });

  if($('.owl-dot').length > 4) {
    $('.owl-dot').css({'width':'60px','height':'60px'});
    console.log($('.owl-dot').length);
  }

});
