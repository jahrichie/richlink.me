 $(function(){
           //close flash message manually
          $('[data-behavior~=closeMe]').click(function () {
            $('[data-behavior~=slideUp]').slideUp(400);
          }); 
          
          //main coda slider call, doesn;t work with data-behavior
          $('#slider-id').delay(5000).liquidSlider({
            responsive: false,
            autoSlide:false,
            autoHeight:true,
            preloader: true,
            hashLinking: true,
            hashNames: true,
            hashCrossLinks: true,
            dynamicTabs: false,
            crossLinks: true
          });
          //Slide flash message out automatically.
          // $('[data-behavior~=slideUp]').delay(5000).slideUp(400);

          //tooltip
           var targets = $( '[rel~=tooltip]' ),
                  target  = false,
                  tooltip = false,
                  title   = false;
           
              targets.bind( 'mouseenter', function()
              {
                  target  = $( this );
                  tip     = target.attr( 'title' );
                  tooltip = $( '<div id="tooltip"></div>' );
           
                  if( !tip || tip == '' )
                      return false;
           
                  target.removeAttr( 'title' );
                  tooltip.css( 'opacity', 0 )
                         .html( tip )
                         .appendTo( 'body' );
           
                  var init_tooltip = function()
                  {
                      if( $( window ).width() < tooltip.outerWidth() * 1.5 )
                          tooltip.css( 'max-width', $( window ).width() / 2 );
                      else
                          tooltip.css( 'max-width', 340 );
           
                      var pos_left = target.offset().left + ( target.outerWidth() / 2 ) - ( tooltip.outerWidth() / 2 ),
                          pos_top  = target.offset().top - tooltip.outerHeight() - 20;
           
                      if( pos_left < 0 )
                      {
                          pos_left = target.offset().left + target.outerWidth() / 2 - 20;
                          tooltip.addClass( 'left' );
                      }
                      else
                          tooltip.removeClass( 'left' );
           
                      if( pos_left + tooltip.outerWidth() > $( window ).width() )
                      {
                          pos_left = target.offset().left - tooltip.outerWidth() + target.outerWidth() / 2 + 20;
                          tooltip.addClass( 'right' );
                      }
                      else
                          tooltip.removeClass( 'right' );
           
                      if( pos_top < 0 )
                      {
                          var pos_top  = target.offset().top + target.outerHeight();
                          tooltip.addClass( 'top' );
                      }
                      else
                          tooltip.removeClass( 'top' );
           
                      tooltip.css( { left: pos_left, top: pos_top } )
                             .animate( { top: '+=10', opacity: 1 }, 50 );
                  };
           
                  init_tooltip();
                  $( window ).resize( init_tooltip );
           
                  var remove_tooltip = function()
                  {
                      tooltip.animate( { top: '-=10', opacity: 0 }, 50, function()
                      {
                          $( this ).remove();
                      });
           
                      target.attr( 'title', tip );
                  };
           
                  target.bind( 'mouseleave', remove_tooltip );
                  tooltip.bind( 'click', remove_tooltip );
              });


  });//end  ready function

          

