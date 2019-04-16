$("#category-search-icon").hover(function() {
  $(this).children('#header-category-box').show();
  $('#header-child-category-box').hide();
  $("#header-grand-child-category-box").hide();
}, function() {
    $(this).children('.header-category-box').hide();
});


