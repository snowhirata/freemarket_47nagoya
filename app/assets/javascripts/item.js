$(function(){
  $('#category-select').change( function(){
    var child_category = $('#category-select select').val();
    if (child_category == '') {
      $('#child-category-select').html('');
    }
  });

  $('.charge-form__price').on("keyup", function(){
    var input = $(".charge-form__price").val();
    var commission = input * 0.10
    var commission_fee = Math.floor(commission)
    var profit = input - commission_fee
    if(input>=300&&input<=9999999){
      $(".commission-label--right").text(commission_fee);
      $(".profit-label--right").text(profit);
    }
    else{
      $(".commission-label--right").text("-")
      $(".profit-label--right").text("-")
    }
  })
})
