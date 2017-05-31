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


//Release 2: Building objects using a constructor function
//Build car object with properties of various data types & at least one function
function Car (model, color, gasMileage) {
  console.log("Initiailizing car:", this);

  this.model = model;
  this.color = color;
  this.gasMileage = gasMileage;

  this.honk = function () { console.log("Honk!"); };

  console.log("Car initialization complete.");
}

Car.prototype.windshieldWipers = function() {console.log("Windshield wipers on.")};

var car1 = new Car("Beetle", "Blue", 15);
car1.honk();
console.log(car1.model);

var car2 = new Car("Ferrari", "Red", 12);
car2.windshieldWipers();

var car3 = new Car("Camry", "Green", 16);
console.log(car3.color);


//declaring an object through literal construction
var motorcycle = {
  condition: "good",
  color: "silver",
  gasMileage: 10,
  speed: 0,
  isMoving: false,
    speedStatus: function() {
      if (!this.isMoving) {
        console.log("Vehicle is currently stopped.");
      } else if (this.isMoving && this.speed != 0) {
        console.log("Your current speed is: " + this.speed + " mph.");
      }
    }
};

motorcycle.speedStatus();
motorcycle.isMoving = true;
motorcycle.speed = 20;
motorcycle.speedStatus();

motorcycle.slowDown = function() {
  if (this.speed >= 80) {
    this.speed -= 20;
    console.log("You're going too fast! Your adjusted speed is: " + this.speed + " mph.");
  }
};

motorcycle.speed = 85;
motorcycle.speedStatus();
motorcycle.slowDown();