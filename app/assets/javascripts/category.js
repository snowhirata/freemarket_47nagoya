$(function(){
  var child_category = $("#header-child-category-box")
  var grand_child_category = $("#header-grand-child-category-box")

  function buildChilodHTML(child){
    var html = `<div class="child_category_box" id=${ child.id }>
                  <a href="#">
                    <h3>
                      ${ child.name }
                    </h3>
                  </a>
                </div>`
    child_category.append(html);
  }

  function buildGrandChildHTML(grand_child){
    var html = `<div class="grand_child_category_box" id=${ grand_child.id }>
                  <a href="#">
                    <h3>
                      ${ grand_child.name }
                    </h3>
                  </a>
                </div>`
    grand_child_category.append(html);
  }

  $(".category_box").on("mouseover", function(){
    $(this).css({
      backgroundColor: "#ea352d"
    });
  }).on("mouseout", function(){
    $(".category_box").css({
      backgroundColor: "#fff"
    });
  });
  $(".category_box").on("mouseenter", function(){
    child_category.empty();
    var id = $(this).attr("id");
    var url = location.href;
    $.ajax({
      type: 'GET',
      url: url,
      data: {"id": id},
      dataType: "json",
    })
    .done(function(child_category){
      if(child_category.length != 0){
        child_category.forEach(function(child){
          buildChilodHTML(child);
        });
      }else{
        child_category.remove();
      }
    })
    .error(function(XMLHttpRequest, textStatus, errorThrown) {
      console.log("XMLHttpRequest : " + XMLHttpRequest.status);
      console.log("textStatus     : " + textStatus);
      console.log("errorThrown    : " + errorThrown.message);
    });
  });
  $(document).on("mouseenter", ".child_category_box", function(){
    grand_child_category.empty();
    $(this).css({
      backgroundColor: "#ea352d"
    }).on("mouseout", function(){
      $(".child_category_box").css({
        backgroundColor: "#fff"
      });
    });
    var id = $(this).attr("id");
    var url = location.href;
    $.ajax({
      type: 'GET',
      url: url,
      data: {"g_id": id},
      dataType: "json",
    })
    .done(function(grand_child_category){
      if(grand_child_category.length != 0){
        grand_child_category.forEach(function(grand_child){
          buildGrandChildHTML(grand_child);
        });
      }else{
        grand_child_category.remove();
      }
    })
    .error(function(XMLHttpRequest, textStatus, errorThrown) {
      console.log("XMLHttpRequest : " + XMLHttpRequest.status);
      console.log("textStatus     : " + textStatus);
      console.log("errorThrown    : " + errorThrown.message);
    });
  });
  $(document).on("mouseenter", ".grand_child_category_box", function(){
    $(this).css({
      backgroundColor: "#ea352d"
    }).on("mouseout", function(){
      $(".grand_child_category_box").css({
        backgroundColor: "#fff"
      });
    });
  });
});
