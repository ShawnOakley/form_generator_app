function parse_label(context){
  var text = context.text();

}


$(document).ready(function(){

  $('.form-list').children('li').click(function(){
    var $target = $(this);
    var $searchField = $(this).parent().children('li');

    var oldAttr = 'hidden'
    console.log($target.attr('style') === 'border: 1px solid red;');
    if ($target.attr('style') === 'border: 1px solid red;') {
      $target.css('border', 'hidden');


      // toggle rendering of new
    } else {
      $target.css('border', '1px solid red');
      $target.siblings('li').css('border','hidden');
      console.log($target.attr("data-id"));
      console.log($target);
      // toggle rendering of edit for id
    };

  });

});
