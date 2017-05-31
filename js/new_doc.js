function add(x, y) {
  return x + y;
}

function addThenMult (x, y) {
  var a = add(x,y);
  return a * x * y;
}

console.log(addThenMult(1, 2));