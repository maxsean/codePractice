//Given a roman numeral, convert it to an integer.

//Input is guaranteed to be within the range from 1 to 3999.

var romanToInt = function(s) {
    var numArray = s.split("")
    var sum = 0
    var rome = {
     M: 1000,
     D: 500,
     C: 100,
     L: 50,
     X: 10,
     V: 5,
     I: 1
    };
    for (var i = 0; i < numArray.length; i++) {
        if (rome[numArray[i]] < rome[numArray[i+1]]) {
            sum += (rome[numArray[i+1]] - rome[numArray[i]])
            i += 1
            } else {
                sum += rome[numArray[i]]
                }
        }
    return sum
}
