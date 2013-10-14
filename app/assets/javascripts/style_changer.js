
function setStyleForSave(color, layout){
  $('.saved-color-style').attr('value', color);
  $('.saved-format-style').attr('value', layout);
}


function applyStyle(context, color, layout){
  $that = context;
  console.log($that)
  if (typeof color === 'undefined') {
    color = "";
  };

  var backgroundColor = color.concat('-background');
  $that.attr( "class", backgroundColor );

  var headerStyle = layout.concat('-header ').concat(color).concat(' group');
  var ulStyle = layout.concat('-ul ').concat(color).concat(' group');
  var liStyle = layout.concat('-li ').concat(color).concat(' group');


  $that.children().children().attr( "class",color);
  $that.children('h2').attr( "class", headerStyle );
  $that.children('.description').attr( "class", headerStyle );
  $that.children().children('ul:first').attr('class', ulStyle);
  $that.children().children('ul:first').children('li').attr( "class", liStyle);

  setStyleForSave(color, layout);
}

$(document).ready(function(){

  $(".style_button_container").delegate('button', 'click', (function(){

    }));

  $('.choice-collection').delegate('.delete-button', 'click', (function(){
    $(this).parent().remove();
  }));

  var layout;
  var color;

  $('.style_button_container nav').delegate('button','click', (function(){
    var css_type = $(this).text();

    $this = $(this).parent().parent().parent().children('div:last')
    console.log($this)

    switch(css_type)
    {
    case "Color 1":

      color = "color1";

      applyStyle($this, color, layout);

      break;
    case "Color 2":
      color = "color2";

      applyStyle($this, color, layout);

      break;
    case "Color 3":
      color = "color3";

      applyStyle($this, color, layout);

      break;
    case "Color 4":
      color = "color4";

      applyStyle($this, color, layout);

      break;

    case "Color 5":

      color = "color5";

      applyStyle($this, color, layout);

      break;
    case "Color 6":

      color = "color6";

      applyStyle($this, color, layout);

      break;

    case "Layout 1":

      layout = "style1";

      applyStyle($this, color, layout);
      break;

    case "Layout 2":

      layout = "style2";

      applyStyle($this, color, layout);

      break;
    case "Layout 3":

      layout = "style3";

      applyStyle($this, color, layout);

      break;
    case "Layout 4":

      layout = "style4";

      applyStyle($this, color, layout);

      break;

    case "Layout 5":

      layout = "style5";

      applyStyle($this, color, layout);

      break;

    default:
      // execute code block 1
      break;
    }
  }))});
