//Determine whether an integer is a palindrome. Do this without extra space.

var isPalindrome = function(x) {
    var num = (""+x).split("")
    var half1 = []
    var half2 = []
    var a = 1
    var b = 0
    if (num.length % 2 == 0) {
        a = 0
        b = 1
    }
    for (var i = 0; i < num.length/2 - a; i++) {
        half1.push(num[i])
    }
    for (var j = num.length - 1; j > num.length/2 - b; j--) {
        half2.push(num[j])
    }
    for (var t = half1.length; t > -1; t--) {
        if (half1[t] !== half2[t]) {
            return false
        }
    }
    return true
}
