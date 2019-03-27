
    $(function(){
      $('.mypage-tabs li').click(function(){
        var index = $('.mypage-tabs li').index(this);
        $('.mypage-tabs li').removeClass('active');
        $(this).addClass('active');
        $('.tab-content ul').removeClass('active').eq(index).addClass('active');
      })
    });

    $(function(){
      $('.transaction-mypage-tabs li').click(function(){
        var index = $('.transaction-mypage-tabs li').index(this);
        $('.transaction-mypage-tabs li').removeClass('active');
        $(this).addClass('active');
        $('.transaction-tab-content ul').removeClass('active').eq(index).addClass('active');
      })
    });