//Given a 32-bit signed integer, reverse digits of an integer. Assume we are dealing with an environment which could only hold integers within the 32-bit signed integer range. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.

var reverse = function(x) {
    var stringInteger = x.toString()
    var arrayInteger = stringInteger.split("")
    var newInteger;
    if (Math.abs(x) > 2147483647) {
        newInteger = "0"
    }
    else if (arrayInteger[0] == "-") {
            arrayInteger.splice(0, 1)
            arrayInteger.reverse().splice(0, 0, "-")
            newInteger = arrayInteger.join("")
        }
    else if (arrayInteger[-1] == "0") {
            arrayInteger.splice(-1, 1)
            newInteger = arrayInteger.reverse().join("")
        }
    else {
        newInteger = arrayInteger.reverse().join("")
    }

    if (Math.abs(Number(newInteger)) > 2147483647) {
        return 0
    }
    else {
        return Number(newInteger)
    }

};
