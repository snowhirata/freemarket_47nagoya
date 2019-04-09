
$(function() {
  // var form = $("charge-form"),
  //     number = form.find('input[name="number"]'),
  //     cvc = form.find('input[name="cvc"]'),
  //     exp_month = form.find('select[name="exp_month"]'),
  //     exp_year = form.find('input[name="exp_year"]');
   Payjp.setPublicKey('pk_test_61e818d4f22147be9f208a2b');
  $("#ivent-button3").click(function(e) {
    // form.find("input[type=submit]").prop("disabled", true);
    console.log('開始')
    e.preventDefault();

    card_number = $('#card_number').val()
    exp_month = $('#exp_month').val()
    // exp_year = $('#exp_year').val()
    exp_year = 2020
    security_code = $('#security_code').val()

    card_number = Number(card_number);
    exp_month = Number(exp_month);
    exp_year = Number(exp_year);
    security_code = Number(security_code);

    console.log(card_number)
    console.log(exp_month)
    console.log(exp_year)
    console.log(security_code)

    var card = {
        number: card_number,
        cvc: security_code,
        exp_month: exp_month,
        exp_year: exp_year
    };
    console.log(card)
    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        // form.find('.payment-errors').text(response.error.message);
        // form.find('button').prop('disabled', false);
        console.log('error')
      }
      else {
        // $(".number").removeAttr("name");
        // $(".cvc").removeAttr("name");
        // $(".exp_month").removeAttr("name");
        // $(".exp_year").removeAttr("name");

        var token = response.id;

        $(".l-single-inner").append($('<input type="hidden" name="creditvalid[payjp_token]" id="creditvalid_payjp_token" />').val(token));
        $(".l-single-inner").get(0).submit();
        // form.append($('<input type="hidden" name="payjpToken" />').val(token));
        // form.get(0).submit();
      }
    });
  });
});