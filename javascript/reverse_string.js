// Write a function to reverse a string

function reverseString1(str) {
  var splitString = str.split("")
  var reverseArray = splitString.reverse()
  var joinArray = reverseArray.join("")
  return joinArray
}

function reverseString2(str) {
  var newString = ""
  for (var i = str.length - 1; i >= 0; i --) {
    newString += str[i]
  }
  return newString
}
