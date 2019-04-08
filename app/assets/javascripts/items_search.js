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
});