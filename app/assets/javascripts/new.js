$(function(){
  $("#item-delete").click(function(e){
    e.preventDefault();
    $(".modal-inner").remove('display');
    $(".modal-overlay").remove('display');
    $(".modal-inner").fadeIn("slow");
    $(".modal-overlay").fadeIn("slow");
  }); 
});


