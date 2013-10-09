


function addChoice(event) {

    var input_stuff = $("<div><br><input type='text' name='field[collection][]'><button type='button' class='delete-button'>Delete this choice</button></div>");


    $('.choice-collection').append(input_stuff);



};

$(document).ready(function(){
  $(document).find('.inp').children().toggleClass('hidden')
  $(document).find(".select-button").first().click();
  $('.choice-collection').delegate('.delete-button', 'click', (function(){
    $(this).parent().remove();
  }));

  $('.input_field').delegate('.select-button', 'change', (function(){
    console.log($(this).siblings().parent().siblings())
    hidden_id = $(this).val();

    console.log($(this).siblings().parent().siblings().find('.' + hidden_id))
    $(this).siblings().parent().siblings().find('.' + hidden_id).toggleClass('hidden');
  }));
});




