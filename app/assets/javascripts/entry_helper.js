function parse_label(context){
  var text = context.text();
}

$(function(){
	$.extend($.fn.disableTextSelect = function() {
		return this.each(function(){
			if($.browser.mozilla){//Firefox
				$(this).css('MozUserSelect','none');
			}else if($.browser.msie){//IE
				$(this).bind('selectstart',function(){return false;});
			}else{//Opera, etc.
				$(this).mousedown(function(){return false;});
			}
		});
	});
	$('.noSelect').disableTextSelect();
});


$(document).ready(function(){

  $('.new-entry-show-button').click(function(event){
    $( "#entry-input" ).slideToggle( "slow");
    $( "#entry-input" ).toggleClass( "visibility");
    event.stopImmediatePropagation()
    if ($(this).text() === "Add a new entry") {
      $(this).text("Close entry creation window");
      $(document).find(".select-button").first().click();
    } else {
      $(this).text("Add a new entry");
    };
    });

  $('.form-list').children('li').dblclick(function(event){
    this_event = event
    event.stopImmediatePropagation()
    var $target = $(this);
    $target.nextAll('.button_to').first().children().children().click();
  });
  $( "#entry-input" ).css('display','none');
});
