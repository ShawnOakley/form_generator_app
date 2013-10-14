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
      // toggle rendering of edit for id
    };

  });


  $(document).find(".select-button").first().click();

});




