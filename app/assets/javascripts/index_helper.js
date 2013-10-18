$(document).ready(function(){

  $( "#dialog-form" ).dialog({
        autoOpen: false,
        height: 300,
        width: 350,
        modal: true,
        buttons: {
          "Choose someone to the form with": function() {
            var bValid = true;
            allFields.removeClass( "ui-state-error" );

            bValid = bValid && checkLength( name, "username", 3, 16 );
            bValid = bValid && checkLength( email, "email", 6, 80 );
            bValid = bValid && checkLength( password, "password", 5, 16 );

            bValid = bValid && checkRegexp( name, /^[a-z]([0-9a-z_])+$/i, "Username may consist of a-z, 0-9, underscores, begin with a letter." );
            // From jquery.validate.js (by joern), contributed by Scott Gonzalez: http://projects.scottsplayground.com/email_address_validation/
            bValid = bValid && checkRegexp( email, /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i, "eg. ui@jquery.com" );
            bValid = bValid && checkRegexp( password, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9" );

            if ( bValid ) {
              $( "#users tbody" ).append( "<tr>" +
                "<td>" + name.val() + "</td>" +
                "<td>" + email.val() + "</td>" +
                "<td>" + password.val() + "</td>" +
              "</tr>" );
              $( this ).dialog( "close" );
            }
          },
          Cancel: function() {
            $( this ).dialog( "close" );
          }
        },
        close: function() {
          allFields.val( "" ).removeClass( "ui-state-error" );
        }
      });

  $('.share-button').on('click', function(event){

    event.preventDefault();
    event.stopImmediatePropagation();

    $( "#dialog-form" ).dialog( "open" );
    console.log('click');

  })

});


function colorIndex(color_choice, form_id){

  $this = $('#'+form_id+'.display-field').children().children('ul').children('form:first');

  switch(color_choice)
  {
  case "Color 1":

    $this.children('li').css('background-color','#49A8A8');
    $this.children('li').css('text-decoration', 'none');
    $this.children('li').css('width', '200px');

    $this.parent().css('background-color', '#5772AF');
    $this.parent().css('padding', '10px');
    $this.parent().css('text-decoration', 'none');
    $this.parent().css('width', '300px');

    $this.siblings('h2').css('background-color', '#49A8A8');
    $this.siblings('h2').css('text-decoration', 'none');
    $this.siblings('h2').css('width', '300px');

    break;
  case "Color 2":
    $this.children('li').css('background-color','#B4A381');
    $this.children('li').css('text-decoration', 'none');

    $this.parent().css('background-color', '#694242');
    $this.parent().css('padding', '10px');
    $this.parent().css('border', '2px solid black');
    $this.parent().css('text-decoration', 'none');

    $this.siblings('h2').css('background-color', '#B4A381');
    $this.siblings('h2').css('text-decoration', 'none');

    break;

  case "Color 3":
    $this.children('li').css('background-color','#9D74A1');
    $this.children('li').css('text-decoration', 'none');

    $this.parent().css('background-color', '#5C3946');
    $this.parent().css('padding', '10px');
    $this.parent().css('border', '2px solid black');
    $this.parent().css('text-decoration', 'none');

    $this.siblings('h2').css('background-color', '#9D74A1');
    $this.siblings('h2').css('text-decoration', 'none');

    break;

  case "Color 4":
    $this.children('li').css('background-color','#E8C5B1');
    $this.children('li').css('text-decoration', 'none');

    $this.parent().css('background-color', '#5E8B7F');
    $this.parent().css('padding', '10px');
    $this.parent().css('border', '2px solid black');
    $this.parent().css('text-decoration', 'none');

    $this.siblings('h2').css('background-color', '#E8C5B1');
    $this.siblings('h2').css('text-decoration', 'none');
    break;

  case "Color 5":
    $this.children('li').css('background-color','#FFFEFE');
    $this.children('li').css('text-decoration', 'none');

    $this.parent().css('background-color', 'silver');
    $this.parent().css('padding', '10px');
    $this.parent().css('border', '2px solid black');
    $this.parent().css('text-decoration', 'none');

    $this.siblings('h2').css('background-color', '#FFFEFE');
    $this.siblings('h2').css('text-decoration', 'none');

    break;
  case "Clear Color":
    $this.children('li').css('background-color','white');
    $this.children('li').css('text-decoration', 'none');

    $this.parent().css('background-color', 'white');
    $this.parent().css('padding', '10px');
    $this.parent().css('text-decoration', 'none');

    $this.siblings('h2').css('background-color', 'white');
    $this.siblings('h2').css('text-decoration', 'none');

    break;
  default:
    // execute code block 1
    break;
  }
};

function layoutIndex(layout_choice, form_id){

  $this = $('#'+form_id+'.display-row').children().children('ul').children('form:first');
  switch(layout_choice)
  {
  case "Layout 1":
    $this.siblings('h2').css('font-family', 'Raleway, Helvetica, Arial, sans-serif');
    $this.children('li').css('font-family', 'Goudy Bookletter 1911, Georgia, Times, serif');

    $this.siblings('h2').css('text-align', 'center');
    $this.siblings('h2').css('padding', '5px 0');
    $this.siblings('h2').css('border', '2px solid black');

    $this.parent().css('padding-top', '15px');
    $this.parent().css('padding-bottom', '15px');

    $this.children('li').css('list-style','none');
    $this.children('li').css('padding','10px');
    $this.children('li').css('border-top','2px solid black');
    $this.children('li').css('border-left', '2px solid black');
    $this.children('li').css('border-right', '2px solid black');


    break;

  case "Layout 2":


    $this.siblings('h2').css('font-family', 'Allerta, Helvetica, Arial, sans-seriff');
    $this.children('li').css('font-family', '"Crimson Text", Georgia, Times, serif');


    $this.siblings('h2').css('text-align', 'center');
    $this.siblings('h2').css('padding', '5px 0');
    $this.siblings('h2').css('border', '2px solid black');

    $this.parent().css('padding-top', '15px');
    $this.parent().css('padding-bottom', '15px');

    $this.children('li').css('list-style','none');
    $this.children('li').css('padding','10px');
    $this.children('li').css('border-top','2px solid black');
    $this.children('li').css('border-left', '2px solid black');
    $this.children('li').css('border-right', '2px solid black');

    break;

  case "Layout 3":

    $this.siblings('h2').css('font-family', "'Allan', Helvetica, Arial, sans-serif");
    $this.children('li').css('font-family', "'Cardo', Georgia, Times, serif");

    $this.siblings('h2').css('text-align', 'center');
    $this.siblings('h2').css('padding', '5px 0');
    $this.siblings('h2').css('border', '2px solid black');

    $this.parent().css('padding-top', '15px');
    $this.parent().css('padding-bottom', '15px');

    $this.children('li').css('list-style','none');
    $this.children('li').css('padding','10px');
    $this.children('li').css('border-top','2px solid black');
    $this.children('li').css('border-left', '2px solid black');
    $this.children('li').css('border-right', '2px solid black');

    break;

  case "Layout 4":

    $this.siblings('h2').css('font-family', '"Molengo", Georgia, Times, serif');
    $this.children('li').css('font-family','"Lekton", Helvetica, Arial, sans-serif');

    $this.siblings('h2').css('text-align', 'center');
    $this.siblings('h2').css('padding', '5px 0');
    $this.siblings('h2').css('border', '2px solid black');

    $this.parent().css('padding-top', '15px');
    $this.parent().css('padding-bottom', '15px');

    $this.children('li').css('list-style','none');
    $this.children('li').css('padding','10px');
    $this.children('li').css('border-top','2px solid black');
    $this.children('li').css('border-left', '2px solid black');
    $this.children('li').css('border-right', '2px solid black');

    break;

  case "Layout 5":
    $this.siblings('h2').css('margin', '0');
    $this.siblings('h2').css('padding', '0');
    $this.siblings('h2').css('border', '0');
    $this.siblings('h2').css('font-family', 'sans-serif');
    $this.siblings('h2').css('display', 'inline-block');

    $this.children('li').css('margin','0');
    $this.children('li').css('padding','0');
    $this.children('li').css('border','0');
    $this.children('li').css('font-family','sans-serif');
    $this.children('li').css('display','inline-block');

    $this.parent().css('margin', '0');
    $this.parent().css('border', '0');
    $this.parent().css('font-family', 'sans-serif');
    $this.parent().css('padding', '0');
    $this.parent().css('display', 'inline-block');

    break;
  default:
    // execute code block 1
    break;
  }

}
