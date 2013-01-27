 $(function(){
      /* Here is the slider using default settings */
      $('#slider-id').liquidSlider();
      /* If you want to adjust the settings, you set an option
         as follows:
          $('#slider-id').liquidSlider({
            autoSlide:false,
            autoHeight:false
          });

         Find more options at http://liquidslider.kevinbatdorf.com/
      */

      /* If you need to access the internal property or methods, use this method.

      var sliderObject = $.data( $('#slider-id')[0], 'liquidSlider');
      console.log(sliderObject);
      */
    });