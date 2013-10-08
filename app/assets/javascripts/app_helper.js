


function addChoice(event) {

    var input_stuff = $("<div><br><input type='text' name='field[collection][]'><button type='button' class='delete-button'>Delete this choice</button></div>");


    $('.choice-collection').append(input_stuff);



};

$(document).ready(function(){
  $('.choice-collection').delegate('.delete-button', 'click', (function(){
    $(this).parent().remove();
  })
)});



