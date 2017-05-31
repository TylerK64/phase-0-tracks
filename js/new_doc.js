function add(x, y) {
  return x + y;
}

function addThenMult (x, y) {
  x = add(x,y);
  return x * y;
}

console.log(addThenMult(3, 2));