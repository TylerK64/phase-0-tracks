var names = ["Ed", "Bob", "Tony", "Spike"];
var colors = ["blue", "red", "green", "yellow"];



//Release 1: build an object that takes two arrays and stores each as 'property, value' pair in object
//function assumes arr1 is the array of names & arr2 is the array of colors

var horses = function (arr1, arr2) {
  list = {};
  if (arr1.length != arr2.length) {
    return false;
  }

  for (var i = 0; i < arr1.length; i++) {
    var color = arr1[i];
    list[color] = "";
  }

  for (var i = 0; i < arr2.length; i++) {
    var name = arr2[i];
    var color = arr1[i];
    if (list.hasOwnProperty(color)) {
      list[color] = name;
    }
  }
  return list;
}

var list = horses (names, colors);
console.log(list);