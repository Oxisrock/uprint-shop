  //Columnas de igual alto
  if (screen.width > 800) { 
    var altura_arr = [];
    $('.equalhigh').each(function(){
      var altura = $(this).height();
      altura_arr.push(altura);
    });
    altura_arr.sort(function(a, b){return b-a}); 
    $('.equalhigh').each(function(){
      $(this).css('height',altura_arr[0]);
    });
  }
  else{}