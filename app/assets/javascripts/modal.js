  //センタリングをする関数
  function centeringModalSyncer(){
    var w = $(window).width();
    var h = $(window).height();
    var cw = $("#modal-content").outerWidth();
    var ch = $("#modal-content").outerHeight();
    var pxleft = ((w - cw)/2);
    var pxtop = ((h - ch)/2);
    $("#modal-content").css({"left": pxleft + "px"});
    $("#modal-content").css({"top": pxtop + "px"});
  }


  $("#modal-open").click(function(){
    $(this).blur(); 
    if($("#modal-overlay")[0]) return false ; 
    $("body").append('<div id="modal-overlay"></div>');

    centeringModalSyncer();
    $("#modal-overlay").fadeIn("slow");
    $("#modal-content").fadeIn("slow");  

    
  });


