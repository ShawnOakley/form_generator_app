
function setStyleForSave(color, layout){
  $('.saved-color-style').attr('value', color);
  $('.saved-format-style').attr('value', layout);
}


function applyStyle(context, color, layout){
  $that = context;

  if (typeof color === 'undefined') {
    color = "";
  };

  var colorString = color.replace(' ', '').toLowerCase();
  var layoutString = layout.replace(' ', '').toLowerCase();

  var backgroundColor = colorString.concat('-background');

  $that.attr( "class", backgroundColor );

  var headerStyle = layoutString.concat('-header ').concat(colorString).concat(' group');
  var ulStyle = layoutString.concat('-ul ').concat(colorString).concat(' group');
  var liStyle = layoutString.concat('-li ').concat(colorString).concat(' group');

  $that.children().children().attr( "class",color);
  $that.find('h2').attr( "class", headerStyle );
  $that.find('.description').attr( "class", headerStyle );
  $that.find('ul:first').attr('class', ulStyle);
  $that.find('ul:first').children('li').attr( "class", liStyle);

  setStyleForSave(color, layout);
}

$(document).ready(function(){

  $('.choice-collection').delegate('.delete-button', 'click', (function(){
    $(this).parent().remove();
  }));

  var layout;
  var color;

  $('.style_button_container nav').delegate('button','click', (function(){
    var css_type = $(this).text();

    $this = $(this).parent().parent().parent().children('div:last')

    switch(css_type)
    {
    case "Color 1":

      color = "Color 1";

      applyStyle($this, color, layout);

      break;
    case "Color 2":
      color = "Color 2";

      applyStyle($this, color, layout);

      break;
    case "Color 3":
      color = "Color 3";

      applyStyle($this, color, layout);

      break;
    case "Color 4":
      color = "Color 4";

      applyStyle($this, color, layout);

      break;

    case "Color 5":

      color = "Color 5";

      applyStyle($this, color, layout);

      break;
    case "Clear Color":

      color = "Color 6";

      applyStyle($this, color, layout);

      break;

    case "Layout 1":

      layout = "Layout 1";

      applyStyle($this, color, layout);
      break;

    case "Layout 2":

      layout = "Layout 2";

      applyStyle($this, color, layout);

      break;
    case "Layout 3":

      layout = "Layout 3";

      applyStyle($this, color, layout);

      break;
    case "Layout 4":

      layout = "Layout 4";

      applyStyle($this, color, layout);

      break;

    case "Clear Format":

      layout = "Layout 5";

      applyStyle($this, color, layout);

      break;

    default:
      // execute code block 1
      break;
    }
  }))});
