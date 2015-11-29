function update()
  { 
     $.get('/', function(data) 
     {
         $('#divToChange').html(data);
     });
  }
$(document).ready(function($){
  window.setInterval('update()', 300000);
});