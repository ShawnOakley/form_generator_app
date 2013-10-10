


function addChoice(event) {

    var input_stuff = $("<div><br><input type='text' name='field[collection][]'><button type='button' class='delete-button'>Delete this choice</button></div>");


    $('.choice-collection').append(input_stuff);



};

$(document).ready(function(){

  $('.choice-collection').delegate('.delete-button', 'click', (function(){
    $(this).parent().remove();
  }));

  $('.style_button_container nav').delegate('button','click', (function(){
    var css_type = $(this).text();

    $target = $(this).parent().parent().parent().children('div:last')
    switch(css_type)
    {
    case "Style 1":

      $this = $(this).parent().parent().parent().children('div:last')
      $this.css( "background", "#49A8A8" );

      $this.css( "font-family", "Raleway" );
      $this.children().children().css( "text-align", "center" );


      $this.children().children().css( "background", "#5772AF" );

      $this.css( "border-radius', '25px" );

      break;
    case "Style 2":
      $this = $(this).parent().parent().parent().children('div:last')
      $this.css( "background", "#694242" );

      $this.css( "font-family", "Raleway" );
      $this.children().children().css( "text-align", "center" );


      $this.children().children().css( "background", "#B4A381" );

      $this.css( "border-radius', '25px" );

      break;
    case "Style 3":
      $this = $(this).parent().parent().parent().children('div:last')
      $this.css( "background", "#9D74A1" );

      $this.css( "font-family", "Raleway" );
      $this.children().children().css( "text-align", "center" );


      $this.children().children().css( "background", "#5C3946" );

      $this.css( "border-radius', '25px" );

      break;
    case "Style 4":
      $this = $(this).parent().parent().parent().children('div:last')
      $this.css( "background", "#49A8A8" );

      $this.css( "font-family", "Raleway" );
      $this.children().children().css( "text-align", "center" );


      $this.children().children().css( "background", "#5772AF" );

      $this.css( "border-radius', '25px" );

      break;
    default:
      // execute code block 1
      break;
    }
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




