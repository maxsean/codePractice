//Given an array containing n distinct numbers taken from 0, 1, 2, ..., n, find the one that is missing from the array.

var missingNumber = function(nums) {
    sorted = nums.sort(function(a, b){return a-b})
    var n = (sorted[sorted.length - 1] - sorted[0] + 1)
    var sum1 = n * (sorted[0] + sorted[sorted.length - 1]) / 2
    var sum2 = 0
    for (var i = 0; i < nums.length; i++) {
        sum2 += nums[i]
    }
    if (sum1 - sum2 === 0 && sorted[0] === 0) {
        return sorted[sorted.length-1] + 1
    } if (sorted[0] !== 0) {
          return 0
          } else {
        return sum1 - sum2
    }
}
