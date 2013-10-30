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

  function changeSlide( newSlide ) {
          // cancel any timeout
          clearTimeout( slideTimeout );

          // change the currSlide value
          currSlide = newSlide;

          // make sure the currSlide value is not too low or high
          if ( currSlide > maxSlide ) currSlide = 0;
          else if ( currSlide < 0 ) currSlide = maxSlide;

          // animate the slide reel
          $slideReel.animate({
              left : currSlide * -900
          }, 400, 'swing', function() {
              // hide / show the arrows depending on which frame it's on
              if ( currSlide == 0 ) $slideLeftNav.hide();
              else $slideLeftNav.show();

              if ( currSlide == maxSlide ) $slideRightNav.hide();
              else $slideRightNav.show();

              // set new timeout if active
              if ( activeSlideshow ) slideTimeout = setTimeout(nextSlide, 10000);
          });

          // animate the navigation indicator
          $activeNavItem.animate({
              left : currSlide * 150
          }, 400, 'swing');
      }

      function nextSlide() {
          changeSlide( currSlide + 1 );
      }

      // define some variables / DOM references
      var activeSlideshow = true,
      currSlide = 0,
      slideTimeout,
      $slideshow = $('#slideshow'),
      $slideReel = $slideshow.find('#slideshow-reel'),
      maxSlide = $slideReel.children().length - 1,
      $slideLeftNav = $slideshow.find('#slideshow-left'),
      $slideRightNav = $slideshow.find('#slideshow-right'),
      $activeNavItem = $slideshow.find('#active-nav-item');

      // set navigation click events

      // left arrow
      $slideLeftNav.click(function(ev) {
          ev.preventDefault();

          activeSlideshow = false;

          changeSlide( currSlide - 1 );
      });

      // right arrow
      $slideRightNav.click(function(ev) {
          ev.preventDefault();

          activeSlideshow = false;

          changeSlide( currSlide + 1 );
      });

      // main navigation
      $slideshow.find('#slideshow-nav a.nav-item').click(function(ev) {
          ev.preventDefault();

          activeSlideshow = false;

          changeSlide( $(this).index() );
      });

      // start the animation
      slideTimeout = setTimeout(nextSlide, 10000);

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




