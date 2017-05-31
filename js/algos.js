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
//use Object.keys(objectVar) to find list of keys for each object inputted
//write function that checks an array to see if there is an element equal to a value/object; use array.includes()
//consider making function to find # of matching keys between two arrays, so main function can iterate a specific number of times (did not implement)  
//compare two keys arrays, if there is a key match -> check values to see if they are equal
//returns true if values (and keys) are equal or false if no key-value pairs are found (output)

function keyValueMatch(obj1, obj2) {
  var keys1 = [];
  var keys2 = [];
  var values1 = [];
  var values2 = [];

  for (var key in obj1) {
    if (obj1.hasOwnProperty(key)) {
      keys1.push(key);
      values1.push(obj1[key]);
    }
  }
  for (var key in obj2) {
    if (obj2.hasOwnProperty(key)) {
      keys2.push(key);
      values2.push(obj2[key]);
    }
  }
  console.log(keys1, values1);
  console.log(keys2, values2);
}


//Function finds a value match between two (key) arrays. 
//Searches through longer array input and returns index of first match, starting at optional index int.
function keyMatch(array1, array2, int) {
  int = int || 0

  if (array1.length >= array2.length) {
    for (var i = 0; i < array2.length; i++) {
      if (array1.includes(array2[i], int)) {
        console.log("Matching key at array2 index: " + i);
        return i;
      }
    }
  } else if (array2.length > array1.length) {
    for (var i = 0; i < array1.length; i++) {
      if (array2.includes(array1[i], int)) {
        console.log("Matching key at array1 index: " + i);
        return i;
      }
    }
  }
  return false;
}

//finding the precise number of key matches between two arrays
/*
function keyMatchValue (array1, array2) {
  var counter = 0;
  if (keyMatch(array1, array2)) {
    var index = keyMatch(array1, array2);
    counter += 1;
  }
}
*/

var obj1 = {name: "Steven", age: 54, weight: 100};
var obj2 = {name: "Tamir", age: 54, weight: 120 };
var ex1 = {animal: "Dog", legs: 4, color: "white", condition: "OK", age: 4};
var ex2 = {animal: "Cat", leg: 3, 'ages': 4, condition: "Good", color: "white"};
var ex3 = {condition: "Good", color: "grey"};

var keys1 = Object.keys(ex1);
var keys2 = Object.keys(ex2);

/*
var key1 = keys1[0];
var key2Index = keys2.indexOf(key1);
var key2 = keys2[key2Index];
console.log("This is key2: " + key2);
*/

//console.log(keyMatch(keys2, keys1, 1));
keyValueMatch(ex1, ex2);

//console.log(keyValueMatch(ex1, ex2));


//Release 2: Generate random test data
//input: function takes integer
//output: function returns an array of strings, with array length equal to integer (input)
//strings are random (nonsensical) words, with min. 1 letter and max 10 letters & of random length
//solution: write function that creates a string of random chars, with random length between 1 and 10
//loop function for integer/input times
//output an array
