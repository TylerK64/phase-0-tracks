$(function() {
  var $h4Text = $('h4').text();
  
  $('nav ul li').html(function() {
     return '<em>' + $(this).html() + '</em>';
  });
  $('nav a').css({
      'background-color': 'blue',
      'font-family': 'Courier'
  });
  
  $(':header').html(function(){
    return '<em>' + $(this).text() + '</em>';
  });
  $("h3[id][class$='line']").append(" : Required Prep Material").css('width', '450px');
  $(":header:not('h4')").each(function() {
    var classes = this.className;
    $(this).append(" - Class: " + '<em>' + classes + '</em>');
  });
  
  var $newOrderedListItem = $('<li><em><b>New</b></em> list item</li>');
  $('ol li:last').after($newOrderedListItem);
  var $orderedListItemsText = $('li b').text();
  $('ol li').append(" " + $orderedListItemsText);
  $('ol li:gt(3)').attr('id', 'color');
  //var $orderedListItem = $('ol li').get(3);
  //$orderedListItem.getElementsByTagName("b").append("and reading new text");
  $('ol li').get(4).firstChild.nextSibling.nodeValue = ' - New definition for types of drums for item 5.';
  $('ol li:last b').remove();
  
  $('tr:odd').on('click', function() {
    $(this).slideUp();
  })
  $('tr:even').on('mouseover click', function() {
    $(this).css('transform', 'rotate(15deg)');
  });
  $('tr:even').on('mouseout', function() {
    $(this).css('transform', 'rotate(0deg)');
  });
  
  $(':input').on('focus', function() {
    $('h4').text("Please write to us, we're getting pretty desperate for new members :/")
  });
  $(':input').blur(function() {
    $('h4').text($h4Text);
  });
  $('form').submit(function() {
    $("form[name='comment']").delay('slow').fadeToggle();
    //can't figure out how to exclude the button element, tried a variety of .not/:not, .filter, etc
  });
});