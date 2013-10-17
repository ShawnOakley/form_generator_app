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



  // AJAX CALL TO SAVE CURRENT FORMATTING

  $('.layout-commit').on("submit", function(event){
    event.preventDefault();
    event.stopImmediatePropagation();
    var url = window.location.pathname;
    var regex = /\/.\//;
    var id = regex.exec(url)[0].replace(/\//g,'').toString();
    var formData =$(this).serialize();
    $.ajax({
      url: ('/forms/'+id),
      type: 'POST',
      data: formData,
      success:function(){

      }
    });
  });

  // $('.delete-button').click(function(event){
  //   event.preventDefault();
  //   event.stopImmediatePropagation();
  //   var id = $(this).attr('id').toString();
  //   console.log(id)
  //   $.ajax({
  //     url: ('/entries/'+id),
  //     type: 'DELETE',
  //     success:function(){
  //       alert('Deleted');
  //     },
  //     error: function() {
  //       alert('Failure');
  //     }
  //   });
  // });

});




