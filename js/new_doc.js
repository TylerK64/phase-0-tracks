//Release 1: Find a key-value match
//write a function that takes two objects (input)
//checks if two objects share a key-value pair (condition)
//use Object.keys(objectInput) to find list of keys for each object inputted
//write function that checks an array to see if there is an element equal to a value/object; use array.includes()
//consider making function to find # of matching keys between two arrays, so main function can iterate a specific number of times (did not implement)  
//compare two keys arrays, if there is a key match -> check values to see if they are equal
//returns true if values (and keys) are equal or false if no key-value pairs are found (output)

function keyValueMatch(obj1, obj2) {
  var keys1 = Object.keys(obj1);
  var keys2 = Object.keys(obj2);

  // && (i < keys1.length - 1 || i < keys2.length - 1) <- might need as condition for while loop
  for (var i = 0; i < keys1.length || i < keys2.length; i++) {
    //i = keyMatch(keys1, keys2, i);
    console.log("iteration step number: " + i);
    if (keyMatch(keys1, keys2, i)) {
      if (keys1.length >= keys2.length) {
        var key2 = keys2[i];
        var key1Index = keys1.indexOf(key2);
        var key1 = keys1[key1Index];
        if (obj1[key1] === obj2[key2]) {
          console.log("Matching key, value pair is: '" + key1 + ", " + obj1[key1] + "' at array1 index " + key1Index);
          return true;
        }
      } else if (keys2.length > keys1.length) {
        var key2 = keys2[i];
        var key1Index = keys1.indexOf(key2);
        var key1 = keys1[key1Index];
        if (obj2[key2] === obj1[key1]) {
          console.log("Matching key, value pair is: '" + key2 + ", " + obj2[key2] + "' at array2 index " + key1Index);
          return true;
        }
      }
    }
  }
  return false;
}

//Function finds a value match between two (key) arrays. 
//Searches through longer array input and returns index of first match, starting at optional index int.
function keyMatch(array1, array2, int) {
  int = int || 0

  if (array1.length >= array2.length) {
    for (var i = 0; i < array2.length; i++) {
      if (array1.includes(array2[i], int)) {
        console.log("Matching key: " + array2[i] + " at iteration step: " + i);
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

var obj1 = {name: "Steven", age: 54, weight: 100};
var obj2 = {name: "Tamir", age: 54, weight: 120 };
var ex1 = {animal: "Dog", leg: 4, color: "white", condition: "OK", age: 4}; //code doesn't work if 'age' = 'ages', fix loops above
var ex2 = {animal: "Cat", leg: 3, condition: "Good", color: "white"};
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
console.log(keyValueMatch(ex1, ex2));