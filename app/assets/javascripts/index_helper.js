function colorIndex(color_choice, form_id){

  $this = $('#'+form_id+'.display-field').children().children('ul').children('form:first');

  switch(color_choice)
  {
  case "Color 1":

    $this.children('li').css('background-color','#49A8A8');

    $this.parent().css('background-color', '#5772AF');
    $this.parent().css('padding', '10px');
    $this.parent().css('border-radius', '25px');
    $this.parent().css('border', '2px solid black');

    $this.siblings('h2').css('background-color', '#49A8A8');

    break;
  case "Color 2":
    $this.children('li').css('background-color','#B4A381');

    $this.parent().css('background-color', '#694242');
    $this.parent().css('padding', '10px');
    $this.parent().css('border-radius', '25px');
    $this.parent().css('border', '2px solid black');

    $this.siblings('h2').css('background-color', '#B4A381');

    break;
  case "Color 3":
    $this.children('li').css('background-color','#9D74A1');

    $this.parent().css('background-color', '#5C3946');
    $this.parent().css('padding', '10px');
    $this.parent().css('border-radius', '25px');
    $this.parent().css('border', '2px solid black');

    $this.siblings('h2').css('background-color', '#9D74A1');

    break;
  case "Color 4":
    $this.children('li').css('background-color','#E8C5B1');

    $this.parent().css('background-color', '#5E8B7F');
    $this.parent().css('padding', '10px');
    $this.parent().css('border-radius', '25px');
    $this.parent().css('border', '2px solid black');

    $this.siblings('h2').css('background-color', '#E8C5B1');
    break;
  case "Color 5":
    $this.children('li').css('background-color','#FFFEFE');

    $this.parent().css('background-color', 'silver');
    $this.parent().css('padding', '10px');
    $this.parent().css('border-radius', '25px');
    $this.parent().css('border', '2px solid black');

    $this.siblings('h2').css('background-color', '#FFFEFE');

    break;
  case "Color 6":
    $this.children('li').css('background-color','white');

    $this.parent().css('background-color', 'white');
    $this.parent().css('padding', '10px');

    $this.siblings('h2').css('background-color', 'white');

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

    $this.siblings('h2').css('text-align', 'center');
    $this.siblings('h2').css('font-family', 'Raleway, Helvetica, Arial, sans-serif');
    $this.siblings('h2').css('text-decoration', 'underline');
    $this.siblings('h2').css('padding', '5px 0');
    $this.siblings('h2').css('border-radius', '25px');
    $this.siblings('h2').css('border', '2px solid black');

    $this.parent().css('border-bottom', '2px solid black');
    $this.parent().css('border-radius', '25px');
    $this.parent().css('padding-top', '15px 0');

    $this.children('li').css('list-style','none');
    $this.children('li').css('padding','10px');
    $this.children('li:first').css('border-radius', '25px 25px 0 0');
    $this.children('li:last').css('border-radius', '0 0 25px 25px');
    $this.children('li').css('border-top','2px solid black');
    $this.children('li').css('border-left', '2px solid black');
    $this.children('li').css('border-right', '2px solid black');
    $this.children('li:last').css('border-bottom', '2px solid black');
    $this.children('li').css('font-family', 'Goudy Bookletter 1911, Georgia, Times, serif');

    break;

  case "Layout 2":

    $this.siblings('h2').css('text-align', 'center');
    $this.siblings('h2').css('font-family', 'Allerta, Helvetica, Arial, sans-seriff');
    $this.siblings('h2').css('text-decoration', 'underline');
    $this.siblings('h2').css('padding-bottom', '20px');
    $this.siblings('h2').css('padding-top', '10px');
    $this.siblings('h2').css('border', '1px solid black');
    $this.siblings('h2').css('border-radius', '10px 10px');
    $this.siblings('h2').css('float', 'right');
    $this.siblings('h2').css('width', '30%');
    $this.siblings('h2').css('height', 'auto');

    $this.parent().css('border', '2px solid black');
    $this.parent().css('border-radius', '10px 10px');
    $this.parent().css('padding', '10px');
    $this.parent().css('width', 'auto');
    $this.parent().css('display', 'table');
    $this.parent().css('content', '""');
    $this.parent().css('clear', 'both');

    $this.children('li').css('list-style','none');
    $this.children('li').css('padding','10px');
    $this.children('li').css('border-bottom','2px solid black');
    $this.children('li').css('font-family', '"Crimson Text", Georgia, Times, serif');
    $this.children('li').css('width','92%');
    $this.children('li').css('float','left');
    $this.children('li').css('display', 'table');
    $this.children('li').css('content', '""');
    $this.children('li').css('clear', 'both');
    $this.children('li').css('border-top','2px solid black');
    $this.children('li').css('border-left', '2px solid black');
    $this.children('li').css('border-right', '2px solid black');
    $this.children('li:first').css('border-radius', '25px 25px 0 0');
    $this.children('li:last').css('border-radius', '0 0 25px 25px');

    break;

  case "Layout 3":

    $this.siblings('h2').css('text-decoration', 'underline');
    $this.siblings('h2').css('font-family', "'Allan', Helvetica, Arial, sans-serif");
    $this.siblings('h2').css('padding', '5px');
    $this.siblings('h2').css('border-radius', '25px');
    $this.siblings('h2').css('border', '2px solid black');
    $this.siblings('h2').css('float', 'right');
    $this.siblings('h2').css('width', '30%');
    $this.siblings('h2').css('margin-top', '10px');

    $this.parent().css('border', '2px solid black');
    $this.parent().css('border-radius', '10px 10px');
    $this.parent().css('padding', '0 5px');
    $this.parent().css('width', '55%');
    $this.parent().css('display', 'table');
    $this.parent().css('content', '""');
    $this.parent().css('clear', 'both');

    $this.children('li').css('list-style','none');
    $this.children('li').css('padding','10px');
    $this.children('li').css('border-bottom', '2px solid black');
    $this.children('li').css('font-family', "'Cardo', Georgia, Times, serif");

    break;

  case "Layout 4":

    $this.children('li').css('list-style','none');
    $this.children('li').css('padding','10px');
    $this.children('li').css('border-top','2px solid black');
    $this.children('li').css('border-right','2px solid black');
    $this.children('li').css('border-left','2px solid black');
    $this.children('li').css('font-family','"Lekton", Helvetica, Arial, sans-serif');

    $this.parent().css('border', '2px solid black');
    $this.parent().css('border-radius', '10px');
    $this.parent().css('padding', '0 5px');
    $this.parent().css('padding-bottom', 'auto');
    $this.parent().css('padding-top', 'auto');

    $this.siblings('h2').css('font-family', '"Molengo", Georgia, Times, serif');
    $this.siblings('h2').css('border-radius', '25px');
    $this.siblings('h2').css('padding', '5%');
    $this.siblings('h2').css('border', '2px solid black');
    $this.siblings('h2').css('text-decoration', 'underline');
    $this.siblings('h2').css('float', 'left');
    $this.siblings('h2').css('clear', 'both');
    $this.siblings('h2').css('margin-top', '10px');
    $this.siblings('h2').css('vertical-align', 'bottom');

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
    $this.parent().css('padding', '10px');
    $this.parent().css('display', 'inline-block');

    break;
  default:
    // execute code block 1
    break;
  }





}
