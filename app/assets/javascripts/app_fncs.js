 $(function(){
          //main coda slider call, doesn;t work with data-behavior
          $('#slider-id').liquidSlider({
            responsive: true,
            autoSlide:false,
            autoHeight:true,
            preloader: true,
            hashLinking: true,
            hashNames: true,
            hashCrossLinks: true,
            dynamicTabs: false,
            crossLinks: true
          });
          //Slide flash message out.
          $('[data-behavior~=slideUp]').delay(5000).slideUp(400);
  });

   //close flash message manually
  $('[data-behavior~=closeMe]').click(function () {
    $('[data-behavior~=slideUp]').slideUp(400);
  });           

