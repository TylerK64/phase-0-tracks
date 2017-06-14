function myFunction() {
    var x = document.getElementById("myList").innerHTML;
    document.getElementById("demo").innerHTML = x;
    element.insertBefore(unorderedList, child);
    console.log(x);

    var h = document.getElementsByTagName("H1")[0];
    var typ = document.createAttribute("class");
    typ.value = "democlass";
    h.attributes.setNamedItem(typ);
}

var y = document.getElementById("id");
var element = document.getElementById("div1");

var unorderedList = document.createElement("ul");
var node = document.createTextNode("New text");
unorderedList.appendChild(node);

var child = document.getElementById("p1");
var i = document.getElementById("myList").innerHTML;
//element.insertBefore(unorderedList, child);



var btn = document.getElementsByTagName("BUTTON")[0];
var z = btn.attributes.length;
console.log(z);

var paras = document.getElementsByTagName("P");
console.log(paras);
//console.log(paras.length);

var h2 = document.getElementsByTagName("H2")[0];
h2.setAttribute("class", "democlass democlass2")
var attr = h2.getAttributeNode("class")//.value;
console.log(h2.classList[1]);
console.log(h2.className);
console.log(attr);


var a = document.getElementById("id");
console.log(a.childElementCount);
console.log(a.childNodes);    //all child nodes, including text and comment nodes
console.log(a.childNodes.length);
console.log(a.children);      //child elements, excluding text & comment nodes

var b = a.getElementsByClassName("democlass");
console.log(b);

console.log(h2.parentNode);
console.log(h2.parentElement);

var p1 = document.getElementById("demo1");    //note no array index number, eg: NOT document.getElementById("demo1")[0]
p1.style.color = "blue";
console.log(p1.style);