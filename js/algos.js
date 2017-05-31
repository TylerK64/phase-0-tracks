//Release 0: Find longest word or phrase from list/array of strings
//input: array of strings
//set a test_string equal to first index of array, if array size is greater than zero
//from index 1 until end of the array, if the length of the i-th index string is greater than (i-1)th string length, then test_string = string at ith index
//return test_string

function longestWord (arr) {
  str = "";
  if (arr.length > 0) {
    var str = arr[0];
  }
  for (var i = 1; i < arr.length; i++) {
    if (arr[i].length > arr[i-1].length) {
      str = arr[i]
    }
    //else if (arr[i].length == arr[i-1.length]) 
    //What to do if two lengths are equal?
  }
  return str;
}

/*
var arr1 = ["long phrase","longest phrase","longer phrase"];
var arr2 = ["pear", "apple", "banana", "watermelon", "blueberry"];
console.log(longestWord(arr1));
console.log(longestWord(arr2));
*/

//Release 1: Find a key-value match
//write a function that takes two objects (input)
//checks if two objects share a key-value pair (condition)
//use Object.keys(objectInput) to find list of keys for each object inputted
//write function that checks an array to see if there is an element equal to a value/object; use array.includes()
//    !!want to compare entirety of two 'keys' arrays such that ALL key matches are found!!
//compare two keys arrays, if there is a key match -> check values to see if they are equal
//returns true if values (and keys) are equal or false if no key-value pairs are found (output)


function keyValueMatch(obj1, obj2) {  
  var keys1 = Object.keys(obj1);
  var keys2 = Object.keys(obj2);

  var i = 0; //need to update value of i to iterate such that all potential match values are considered
  while (keyMatch(keys1, keys2, i) != false) {
    i = keyMatch(keys1, keys2, i);
    var key1 = null;
    var key2 = null;

    if (keys1.length >= keys2.length) {
      key1 = keys1[i];
      key2 = keys2.indexOf(key1);
      if (obj1[key1] === obj2[key2]) {
        return true;
      }
    } else if (keys2.length > keys1.length) {
      key2 = keys2[i];
      key1 = keys1.indexOf(key2);
      if (obj2[key2] === obj1[key1]) {
        return true;
      }
    }
    i = keyMatch(keys1, keys2, i);
  }
  return false;
}


//Function finds an element/value match between two arrays. Returns index of first match, starting from optional index int.
function keyMatch(array1, array2, int) { 
  int = int || 0

  if (array1.length >= array2.length) {
    for (var i = 0; i < array1.length; i++) {
      if (array2.includes(array1[i], int)) {
        return i;
      }
    }
  } else if (array2.length > array1.length) {
    for (var i = 0; i < array2.length; i++) {
      if (array1.includes(array2[i], int)) {
        return i;
      }
    }
  }
  return false;
}

var obj1 = {name: "Steven", age: 54, weight: 100};
var obj2 = {name: "Tamir", age: 54, weight: 120 };
var ex1 = {animal: "Dog", legs: 4, color: "white", condition: "OK", age: 4};
var ex2 = {animal: "Cat", legs: 3, 'age': 4};

var keys1 = Object.keys(ex1);
var keys2 = Object.keys(ex2);

//console.log(keyMatch(keys2, keys1, 2));
console.log(keyValueMatch(ex1, ex2));

//console.log(keyValueMatch(ex1, ex2));


//Release 2: Generate random test data
//input: function takes integer
//output: function returns an array of strings, with array length equal to integer (input)
//strings are random (nonsensical) words, with min. 1 letter and max 10 letters & of random length
//solution: write function that creates a string of random chars, with random length between 1 and 10
//loop function for integer/input times
//output an array
