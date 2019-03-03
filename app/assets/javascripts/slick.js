$(function(){
 $('.owl-dot-inner img').click(function(){
  var $thisImg = $(this).attr('src');
  var $thisAlt = $(this).attr('alt');
  $('.owl-item-inner img').attr({src:$thisImg,alt:$thisAlt});
 });
});
