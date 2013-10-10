
$(document).ready(function(){

  $('.choice-collection').delegate('.delete-button', 'click', (function(){
    $(this).parent().remove();
  }));

  $('.style_button_container nav').delegate('button','click', (function(){
    var css_type = $(this).text();


    switch(css_type)
    {
    case "Color 1":

      $this = $(this).parent().parent().parent().children('div:last')
      $this.css( "background", "#49A8A8" );

      $this.children().children().css( "background", "#5772AF" );

      $this.css( "border-radius', '25px" );

      break;
    case "Color 2":
      $this = $(this).parent().parent().parent().children('div:last')
      $this.css( "background", "#694242" );

      $this.children().children().css( "background", "#B4A381" );


      break;
    case "Color 3":
      $this = $(this).parent().parent().parent().children('div:last')
      $this.css( "background", "#5C3946" );

      $this.children().children().css( "background", "#9D74A1" );


      break;
    case "Color 4":
      $this = $(this).parent().parent().parent().children('div:last')
      $this.css( "background", "#5E8B7F" );


      $this.children().children().css( "background", "#E8C5B1" );


      break;

    case "Color 5":

      $this = $(this).parent().parent().parent().children('div:last')
      $this.css( "background", "grey" );

      $this.children().children().css( "background", "white" );


      break;
    case "Color 6":
      $this = $(this).parent().parent().parent().children('div:last')
      $this.css( "background", "#694242" );

      $this.children().children().css( "background", "#B4A381" );


      break;


    case "Layout 1":

      $this = $(this).parent().parent().parent().children('div:last').children()

      $this.children('header:first').attr( "class", "style1-header" );
      $this.children('ul:first').attr('class', 'style1-ul');
      $this.children('ul:first').children('li').attr( "class", "style1-li");


      break;
    case "Layout 2":

      $this = $(this).parent().parent().parent().children('div:last').children()

      $this.children('header:first').attr( "class", "style2-header" );
      $this.children('ul:first').attr('class', 'style2-ul');
      $this.children('ul:first').children('li').attr( "class", "style2-li");


      break;
    case "Layout 3":

      $this = $(this).parent().parent().parent().children('div:last').children()

      $this.children('header:first').attr( "class", "style3-header" );
      $this.children('ul:first').attr('class', 'style3-ul');
      $this.children('ul:first').children('li').attr( "class", "style3-li");


      break;
    case "Layout 4":

      $this = $(this).parent().parent().parent().children('div:last').children()

      $this.children('header:first').attr( "class", "style4-header" );
      $this.children('ul:first').attr('class', 'style4-ul');
      $this.children('ul:first').children('li').attr( "class", "style4-li");


      break;

    case "Layout 5":

      $this = $(this).parent().parent().parent().children('div:last').children()

      $this.children('header:first').attr( "class", "style5-header" );
      $this.children('ul:first').attr('class', 'style5-ul');
      $this.children('ul:first').children('li').attr( "class", "style5-li");


      break;

    default:
      // execute code block 1
      break;
    }
  }))});
