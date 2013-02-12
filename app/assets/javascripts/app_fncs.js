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

  });

          

