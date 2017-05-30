//function reverse (string)
//create an empty string, which will contain the reversed string
//starting from the last index of the original string, add each char to the new string, looping until the length of the string
//return the new string

function reverse(string) {
  var reverse_string = '';
  for (var i = string.length - 1; i >= 0; i--) {
    reverse_string += string[i];
  }
  return reverse_string;
}

var reverse_string = reverse("hello");
if (1 == 1) {
  console.log(reverse_string);
} else {
  console.log("1 == 2");
}

var readline = require("readline");
var prompts = readline.createInterface(process.stdin, process.stdout);

prompts.question("What string would you like to reverse?", function (input) {
    console.log(reverse(input));
    process.exit();
});