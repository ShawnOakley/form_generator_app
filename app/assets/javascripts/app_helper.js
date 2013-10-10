


function addChoice(event) {

    var input_stuff = $("<div><br><input type='text' name='field[collection][]'><button type='button' class='delete-button'>Delete this choice</button></div>");


    $('.choice-collection').append(input_stuff);



};

$(document).ready(function(){

  $('.choice-collection').delegate('.delete-button', 'click', (function(){
    $(this).parent().remove();
  }));


  $('.input_field').delegate('.select-button', 'click', (function(){

    var hidden_id = $(this).val();
    // console.log('.' + hidden_id);
   //  console.log($(this).siblings().parent().siblings().find('.' + hidden_id));

    $(this).siblings().parent().siblings().addClass('hidden');

    $( "label" ).css( "class", "protected" ).removeClass('hidden')

    $(this).siblings().parent().siblings().find('.' + hidden_id).parent().removeClass('hidden');
  }));



  // $(document).find('.inp').children().toggleClass('hidden')
  $(document).find(".select-button").first().click();

});




