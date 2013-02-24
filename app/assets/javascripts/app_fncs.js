 $(function(){
          //hide the fadein element with js and then fade it back in
          $('[data-behavior~=fadein]').hide();
          $('[data-behavior~=fadein]').fadeIn(1000);
           
          //close flash message manually
          $('[data-behavior~=closeMe]').click(function () {
            $('[data-behavior~=slideUp]').slideUp(400);
          }); 
           //Slide flash message out automatically.
          // $('[data-behavior~=slideUp]').delay(5000).slideUp(400);



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
            crossLinks: true,
            keyboardNavigation: true,
            leftKey: 39,
            rightKey: 37,

          });
 

 });//end ready function

          

