let str = "today is friday";

function reverseWord(str) {
  let result = "";
  let word = "";

  for (let i = 0; i < str.length; i++) {
    if (str[i] === " " || i === str.length - 1) {
      if (i === str.length - 1) {
        word += str[i];
      }
      result = word + " " + result;
      word = "";
    } else {
      word += str[i];
    }
  }

  return result;
}

console.log(reverseWord(str));
// output: friday is today
