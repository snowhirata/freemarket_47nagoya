$(document).on('turbolinks:load', function(){
  $(".header-user-icon").hover(function(){
    var mypageBox = $(".header-mypage-box:not(:animated)");
    mypageBox.show();
    mypageBox.hover(function(){
      mypageBox.show();
    }, function(){
      mypageBox.hide();
    });
  }, function(){
    $(".header-mypage-box").hide();
  });
});
