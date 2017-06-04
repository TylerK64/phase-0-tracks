//Release 0: Find longest word or phrase from list/array of strings
//input: array of strings
//set a test_string equal to first index of array, if array size is greater than zero
//from index 1 until end of the array, if the length of the i-th index string is greater than (i-1)th string length, then test_string = string at ith index
//return test_string
//new longest word is only set when next string in the array is longer, ie words of same length do not overwrite longest word.

function longestWord(arr) {
  var str = "";
  if (arr.length === 0) {
    console.log("Sorry, try an array with some values.")
  } else {
    str = arr[0];
  }
  for (var i = 0; i < arr.length; i++) {
    if (str.length < arr[i].length) {
      str = arr[i]
    }
  }
  return str;
}

var arr1 = ["long phrase","longest phrase","longer phrase"];
var arr2 = ["pear", "apple", "banana", "watermelon", "blueberry"];
console.log(longestWord(arr1));
console.log(longestWord(arr2));


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

function keyValueCompare(obj1, obj2) {
  var keysValues1 = [];
  var keysValues2 = [];
  var keys1 = [];
  var keys2 = [];
  var keyMatches = [];
  var verify = null;

  for (var key in obj1) {
    if (obj1.hasOwnProperty(key)) {
      keys1.push(key);
      keysValues1.push([key, obj1[key]]);
    }
  }
  for (var key in obj2) {
    if (obj2.hasOwnProperty(key)) {
      keys2.push(key);
      keysValues2.push([key, obj2[key]]);
    }
  }

  keyMatches = findKeyMatches(keysValues1, keysValues2, keys1, keys2);
  verify = checkKeyValues(keysValues1, keysValues2, keyMatches);
  return verify;
}

function findKeyMatches (keysValues1, keysValues2, keys1, keys2) {
  var keyMatches = [];
  if (keysValues1.length >= keysValues2.length) {
    for (var i = 0; i < keysValues2.length; i++) {
      if (keys1.includes(keysValues2[i][0])) {
        keyMatches.push(keysValues2[i]);
      }
    }
  } else if (keysValues2.length > keysValues1.length) {
    for (var i = 0; i < keysValues1.length; i++) {
      if (keys2.includes(keysValues1[i][0])) {
        keyMatches.push(keysValues1[i]);
      }
    }
  }
  return keyMatches;
}

function checkKeyValues (keysValues1, keysValues2, keyMatches) {
  if (keysValues1.length >= keysValues2.length) {
    for (var i = 0; i < keysValues1.length; i++) {
      for (var j = 0; j < keyMatches.length; j++) {
        if (keyMatches[j][0] == keysValues1[i][0] && keyMatches[j][1] == keysValues1[i][1]) {
          //console.log("Matching key is: " + keyMatches[j][0] + " matching value is: " + keyMatches[j][1])
          return true;
        }
      }
    }
  } else if (keysValues2.length > keysValues1.length) {
    for (var i = 0; i < keysValues2.length; i++) {
      for (var j = 0; j < keyMatches.length; j++) {
        if (keyMatches[j][0] == keysValues2[i][0] && keyMatches[j][1] == keysValues2[i][1]) {
          //console.log("Matching key is: " + keyMatches[j][0] + " matching value is: " + keyMatches[j][1])
          return true;
        }
      }
    }
  }
  return false;
}

var obj1 = {name: "Steven", age: 54, weight: 100};
var obj2 = {name: "Tamir", ages: 54, weight: 120};
var ex1 = {animal: "Dog", leg: 4, color: "white", condition: "OK", age: 4, property: "exists"};
var ex2 = {animal: "Cat", leg: 3, 'age': 4, condition: "Good", color: "white"};
var ex3 = {condition: "Good", color: "grey"};

/*
keyValueCompare(ex1, ex2);
console.log(keys1);
console.log(keys2);
console.log(keysValues1);
console.log(keysValues2);

var matches = [];
matches = findKeyMatches(keysValues1, keysValues2, keys1, keys2);
console.log("these are the matches: " + matches);

var x = null;
x = checkKeyValues(keysValues1, keysValues2, matches);
console.log(x);
*/

var x = null;
x = keyValueCompare(ex1, ex2);
console.log(x);
x = keyValueCompare(ex2, ex3);
console.log(x);
x = keyValueCompare(ex1, ex3);
console.log(x);
x = keyValueCompare(obj1, obj2);
console.log(x);


//Second (technically third) Implentation - very less robust/kinda cheaterish version. can delete.
//Assumes all keys have values and at each obj has at least one key-value pair
/*
function keyValueMatch (obj1, obj2) {
  var keyValuePairs1 = [];
  var keyValuePairs2 = [];

  for (var key in obj1) {
    if (obj1.hasOwnProperty(key)) {
      var value = obj1[key];
      keyValuePairs1.push(key, value);
    }
  }
  for (var key in obj2) {
    if (obj2.hasOwnProperty(key)) {
      var value = obj2[key];
      keyValuePairs2.push(key, value);
    }
  }

  for (var i = 0; i < keyValuePairs1.length - 1 && i < keyValuePairs2.length - 1; i++) {
    if (keyValuePairs1.length >= keyValuePairs2.length) {
      if (keyValuePairs1.includes(keyValuePairs2[i])) {
        var key2 = keyValuePairs2[i];
        var index1 = keyValuePairs1.indexOf(key2);
        if (keyValuePairs1[index1+1] == keyValuePairs2[i+1]) {
          console.log("The matching key is: " + key2 + ", value is: " + keyValuePairs2[i+1] + " at array2 index: " + i);
          return true;
        }
      }
    } else if (keyValuePairs2.length > keyValuePairs1.length) {
      if (keyValuePairs2.includes(keyValuePairs1[i])) {
        var key1 = keyValuePairs1[i];
        var index2 = keyValuePairs2.indexOf(key1);
        if (keyValuePairs2[index2+1] == keyValuePairs1[i+1]) {
          console.log("The matching key is: " + key1 + ", value is: " + keyValuePairs1[i+1] + " at array1 index: " + i);
          return true;
        }
      }
    }
  }
}

var ex1 = {animal: "Dog", leg: 4, color: "white", condition: "OK", age: 4};
var ex2 = {animal: "Cat", leg: 3, 'age': 4, condition: "Good", color: "white", status: "great"};
console.log(keyValueMatch(ex1, ex2));
*/


//Release 2: Generate random test data
//input: function takes integer
//output: function returns an array of strings, with array length equal to integer (input)
//strings are random (nonsensical) words, with min. 1 letter and max 10 letters & of random length
//solution: write function that creates a string of random chars, with random length between 1 and 10
//loop function for integer/input times
//output an array

function randomData(int) {
  arr = [];
  for (var i = 0; i < int; i++) {
    arr.push(randomString());
  }
  return arr;
}

function randomNumber() {
  return Math.floor((Math.random() * 10) + 1);
}

function randomString() {
  var outputString = "";
  var alphabet = "abcdefghijklmnopqrstuvwxyz";
  var x = randomNumber();
  while (outputString.length < x) {
    outputString += alphabet[Math.floor(Math.random() * alphabet.length)];
  }
  return outputString;
}

for (var i = 0; i < 10; i++) {
  var data = randomData(10);
  console.log("Here is a list of random strings: ", data);
  var word = longestWord(data);
  console.log("The longest word for this array is: " + word);
}