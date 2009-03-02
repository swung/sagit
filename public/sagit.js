$(document).ready(function(){
    $(".shiphome").droppable({
        drop: function(event,ui) {
          $("<li>" + $(this).text() + ui.draggable.text() + "</li>").appendTo("#merge").fadeOut(500).fadeIn(1500);
          ui.draggable.fadeOut(1200);
        }
      });
    $(".vmimage").draggable();
});
