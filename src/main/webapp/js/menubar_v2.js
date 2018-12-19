/* ****************************** */
/*           munubar.js           */
/* ****************************** */


   $(function() {
         
         $('#menuSpan .icon-bar').css('background-color', 'white');
      
         $('#myNavbar li a').css({
            'color' : 'white',
            'font-weight' : 'bold'
         }); //css
      
         $('#myNavbar li a').hover(function() { 
            //상단 메뉴바 마우스 올려놨을 때
              $(this).css({
                'background' : 'transparent',
                 'font-size': '20px',
              }); //css

              if(this.id == "homeImg"){
                 $('#myNavbar li a img').css({
                     'width' : '35'
                   }); //css
              }
         
         }, function() {
            $(this).css({
                 'background' : 'transparent',
                 'font-size': '14px'
              }); //css
            
            if(this.id == "homeImg"){
               $('#myNavbar li a img').css({
                   'width' : '30'
                 }); //css
            }
            
         }); //hover
         
         $('.dropdown-toggle').hover(function() { 
             //상단 메뉴바 마우스 올려놨을 때
               $(this).css({
                 'background' : 'transparent',
                  'font-size': '20px',
               }); //css
          
          }, function() {
             $(this).css({
                  'background' : 'transparent',
                  'font-size': '14px'
               }); //css
             
          }); //hover
         
         $('.dropdown-menu li a').hover(function() { 
               $(this).css({
                 'background' : 'rgba(149, 179, 215, 0.5)',
                 'color' : 'white'
               }); //css
               
          }, function() {
             $(this).css({
                  'background' : 'white',
                  'color' : '#95b3d7'
               }); //css
             
          }); //hover
      
         $('.dropdown-menu li a').css({
           'color' : '#95b3d7',
            
            'min-width' : '12px',
            'border-radius': '2px',
            'font-weight' : 'bold',
            'padding-top' : '7px',
            'padding-bottom' : '7px'
         }); //css
      
      }); //ready