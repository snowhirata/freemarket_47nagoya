$(function(){
  $(".item-delete-btn").on('click', function(){
    $(".modal").fadeIn();
  })
  $(".cancel-btn,.modal").unbind().click(function(){
    $(".modal").fadeOut();
  })
});
