$(function() {
    $('select#sort').change(function() {
        var val = $(this).val();
        console.log(val);
        $.ajax({
            url: '/sort',
            type: 'GET',
            data: {
                sort: val
            },
            dataType: 'html'
        })
        .done(function(data) {
            console.log(data);
            $('.right-contents').html(data)
        })
        .fail(function(){
            console.log('失敗');  
        });
    });

    //クリアボタン
    $('.clear-btn').click(function(){
        console.log('hello');
        $('#clear-name').val('');
        $('#clear-brand').val('');
        $('#clear-price1').val('');
        $('#clear-price2').val('');
        $('select option').attr("selected", false);
        $('#all').prop('checked',false);
        $('.checkbox').prop('checked',false);
        $('#ship-charge-all').prop('checked',false);
        $('.ship-charge-checkbox').prop('checked',false);
    });

    //checkbox関数
    function allCheck(value) {
        $(value).prop('checked', true);
    }
    function allRemove(value) {
        $(value).prop('checked', false);
    }
    //checkbox商品の状態
    $('#all').on('click', function() {
        if ($(this).prop('checked')) {
          allCheck('.checkbox');
        } else {
          allRemove('.checkbox');
        }
    });
    $('.checkbox').on('click', function() {
        if ($(".checkbox:not(:checked)").size() == 0) {
          allCheck('#all');
        } else {
          allRemove('#all');
        }
    });
  
    //checkbox配送料
    $('#ship-charge-all').on('click', function() {
        if ($(this).prop('checked')) {
          allCheck('.ship-charge-checkbox');
        } else {
          allRemove('.ship-charge-checkbox');
        }
    });
    $('.ship-charge-checkbox').on('click', function() {
        if ($(".ship-charge-checkbox:not(:checked)").size() == 0) {
          allCheck('#ship-charge-all');
        } else {
          allRemove('#ship-charge-all');
        }
    });
});


