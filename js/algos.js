//Release 0: Find longest word or phrase from list/array of strings

function longest_word (arr) {
  str = "";
  if (arr.length > 0) {
    str = arr[0];
  }
  for (i = 1; i < arr.length; i++) {
    if (arr[i].length > arr[i-1].length) {
      str = arr[i]
    }
  }
}