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

//want to compare the values of two specific keys for two objects
//(1) create four arrays, two for the keys & values of first object, two for the keys & values of second object
//(2)write function that compares two key arrays, returning the key element whenever there is a match. 
//Also create a copy of the arrays and splice the copies when a match is found to eliminate already matched keys
//(3)make function that takes in keys and compares the key's value between two objects. returns true when there is a match.
//iterate step (3) until step (2) returns false. also need to make exception for when a key element === 0

//need to iterate over multiple key-value pairs

//could return an object literal (containing arrays) for keyValueArrays instead of global variables
var keys1 = [];
var keys2 = [];
var values1 = [];
var values2 = [];

var obj1 = {name: "Steven", age: 54, weight: 100};
var obj2 = {name: "Tamir", age: 54, weight: 120 };
var ex1 = {animal: "Dog", leg: 4, color: "white", condition: "OK", age: 4};
var ex2 = {animal: "Cat", leg: 3, 'age': 4, condition: "Good", color: "white"};
var ex3 = {condition: "Good", color: "grey"};

function keyValueArrays(obj1, obj2) {
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
}

keyValueArrays(ex1, ex2);
var keys1Copy = keys1.slice();
var keys2Copy = keys2.slice();
//console.log(keys1Copy);

function compareKeys(array1, array2) {
  if (array1.length >= array2.length) {
    for (var i = 0; i < keys1Copy.length; i++) {
      if (array2.includes(keys1Copy[i])) {
        return keys1Copy.splice(i, 1);
      }
    }
  } else if (array2.length > array1.length) {
    for (var i = 0; i < keys2Copy.length; i++) {
      if (array1.includes(keys2Copy[i])) {
        return keys2Copy.splice(i, 1);
      }
    }
  }
  return false;
}

//var keys1 = Object.keys(ex1);
//var keys2 = Object.keys(ex2);

//console.log(keys1, keys2, values1, values2);

//while (compareKeys(keys1, keys2)) {
//  console.log(compareKeys(keys1, keys2));
//}


//Release 2: Generate random test data
//input: function takes integer
//output: function returns an array of strings, with array length equal to integer (input)
//strings are random (nonsensical) words, with min. 1 letter and max 10 letters & of random length
//solution: write function that creates a string of random chars, with random length between 1 and 10
//loop function for integer/input times
//output an array
