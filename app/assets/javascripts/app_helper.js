


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


    $(this).siblings().parent().siblings().addClass('hidden');

    $( "label" ).css( "class", "protected" ).removeClass('hidden')

    $(this).siblings().parent().siblings().find('.' + hidden_id).parent().removeClass('hidden');
  }));

  $('.form-list').children().click(function(){
    var $target = $(this);
    var $searchField = $(this).parent().children('li');
    $(this).css('background', 'yellow');
    console.log($( "script:last" ).last().text());
    console.log($('.input-choice'));
    console.log($('.input-choice:first').val());

  });


  $(document).find(".select-button").first().click();

});




