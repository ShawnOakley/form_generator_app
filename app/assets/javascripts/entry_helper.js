function parse_label(context){
  var text = context.text();

}


$(document).ready(function(){

  $('.new-entry-show-button').click(function(event){
    $( "#entry-input" ).slideToggle( "slow");
    $( "#entry-input" ).toggleClass( "visibility");
    event.stopImmediatePropagation()
    if ($(this).text() === "Add a new entry") {
      $(this).text("Close entry creation window");
    } else {
      $(this).text("Add a new entry");
    };
    });

  $('.form-list').children('li').dblclick(function(event){
    this_event = event
    event.stopImmediatePropagation()
    var $target = $(this);
    if ($target.attr('style') === 'border: 1px solid red;') {
      $target.css('border', 'hidden');
      // toggle rendering of new
    } else {
      console.log($target);
      $target.css('border', '1px solid red');
      $target.siblings('li').css('border','hidden');
    $target.nextAll('.button_to').first().children().children().click();
      // toggle rendering of edit for id
    };
  });
  $( "#entry-input" ).css('display','none');
});
