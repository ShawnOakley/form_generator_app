function parse_label(context){
  var text = context.text();

}


$(document).ready(function(){

  $('.new-entry-show-button').click(function(){
    $( "#entry-input" ).slideToggle( "slow");

    if ($(this).text() === "Add a new entry") {
      $(this).text("Close entry creation window");
    } else {
      $(this).text("Add a new entry");
    };
    });

  $('.form-list').children('li').click(function(){
    var $target = $(this);
    var $searchField = $(this).parent().children('li');
    var oldAttr = 'hidden'
    if ($target.attr('style') === 'border: 1px solid red;') {
      $target.css('border', 'hidden');
      // toggle rendering of new
    } else {
      $target.css('border', '1px solid red');
      $target.siblings('li').css('border','hidden');
      $target.nextAll('.button_to').first().children().children().click();

      // toggle rendering of edit for id
    };

  });

});
