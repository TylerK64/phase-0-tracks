var $topnav = $('.topnav');

$(function() {
  var $main = $('#main');
  //$main.addClass('outline');
});


$(function() {
  $('nav ul li').html(function() {
     return '<em>' + $(this).html() + '</em>';
  });
  $('nav a').css({
      'background-color': 'blue',
      'font-family': 'Courier'
  });
  var $newOrderedListItem = $('<li><em><b>New</b></em> list item!</li>');
  $('ol li:last').after($newOrderedListItem);
  $('ol li:gt(3)').attr('id', 'color');
  //var $orderedListItem = $('ol li').get(3);
  //$orderedListItem.getElementsByTagName("b").append("and reading new text");
  $('ol li').get(4).firstChild.nextSibling.nodeValue = ' - New definition for types of drums for item 5.';
});


