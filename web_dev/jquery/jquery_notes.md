New Terminology: 
CDN - Content Delivery Network

New topics:
Attributes (square) vs. Properties (rectangle; newer) - .attr() covers greater range
Callbacks and Functions !!!
https://www.tutorialspoint.com/jquery/jquery-plugins.htm - jQuery plugins
$() - factory function aka 'jQuery()' function
jQuery API's
-keywords: this, event

Notes:
-JS is a combination of ECMA script and DOM
-Pass entire HTML string to create new element, eg: $( '<p class="greet">Hello!</p>' );
-Alt method for new empty element: $( '<p>' );
-Basic syntax: $(selector).action()
-$( 'ul li' );   // select list items that are in unordered lists
JQ: e.target.nodeName;
JS: event.target.tagName;

New languages, libraries, frameworks, APIs, etc:
AJAX - Asyncronous JavaScript And XML. Request/recieve data from a server without reloading a page. Send data to server in background.
-AJAX uses XMLHttpRequest object, JS, & HTML DOM
JSON (stricter) vs JS
XML


To Research:
https://api.jquery.com/  - See left sidebar for various topics (attributes, CSS, events, manipulation etc)
http://api.jquery.com/category/events/event-handler-attachment/   !!!!!!!
https://api.jquery.com/category/ajax/shorthand-methods/
http://jqfundamentals.com/chapter/javascript-basics
https://www.w3schools.com/jquery/jquery_ref_effects.asp
Javascipt vs JQuery overview <- search phrase
jQuery - Quick Guide <- search phrase
[JS DOM element object methods] - https://www.w3schools.com/jsref/dom_obj_all.asp


-try messing around with input types: https://www.w3schools.com/tags/att_input_type.asp
-try onfocus, onblur, onselect, onchange, etc
-finding items by index
-filtering out elements -> $("li").filter(".class")
https://api.jquery.com/category/traversing/filtering/
- .find()
-DOM Element Replacement - replaceWith()
-DOM Manipulation Methods
-.on() method  !!!
-.eq(int) - finding the index of an element
-cut, copy, & paste elements
-plugins
-events, event handlers, event methods, event manipulation methods, event helper methods -> event delegation
http://jqfundamentals.com/chapter/events
-explicit vs implicit iteration & getters vs setters
-JQuery Effect Methods
-UI Library Based Effects
-jQuery - Interactions
-jQuery - Widgets
-jQuery - Theming !!!
https://www.tutorialspoint.com/jquery/jquery-quick-guide.htm
https://www.tutorialspoint.com/jquery/jquery-events.htm
https://learn.jquery.com/events/event-basics/
https://www.tutorialspoint.com/jquery/jquery-utilities.htm
-Check out utilities for sure, contains methods like: $.each(), $.contains()
https://jqueryui.com/
-AJAX (if extra time)

callback function
$("body").click(function(event) {
   console.log("clicked: " + event.target);
});

$(function() {
  console.log( 'ready!' );
});       <==>    $(document).ready()       <-$() is alias for $(document).ready() if you pass it a function

