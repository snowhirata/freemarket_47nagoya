
$(function() {
   Payjp.setPublicKey('pk_test_61e818d4f22147be9f208a2b');
  $("#ivent-button3").click(function(e) {

    e.preventDefault();
    card_number = $('#card_number').val()
    exp_month = $('#exp_month').val()
    exp_year = $('#exp_year').val()
    exp_year = ""+20+exp_year
    security_code = $('#security_code').val()

    card_number = Number(card_number);
    exp_month = Number(exp_month);
    exp_year = Number(exp_year);
    security_code = Number(security_code);

    var card = {
        number: card_number,
        exp_month: exp_month,
        exp_year: exp_year,
        cvc: security_code
    };

     console.log(card)
    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        alert('カード情報を登録できませんでした。正しいカード番号を入力してください');
      }else {
        var token = response.id;
        var brand = response.card[brand];
        console.log(brand)
        $(".l-single-inner").append($('<input type="hidden" name="creditvalid[payjp_token]" id="creditvalid_payjp_token" />').val(token));
        $(".l-single-inner").append($('<input type="hidden" name="creditvalid[payjp_brand]" id="creditvalid_payjp_brand" />').val(brand));
        $(".l-single-inner").get(0).submit();
      }
    });
  });
});
