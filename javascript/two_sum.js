// Given an array of integers, return indices of the two numbers such that they add up to a specific target.

//You may assume that each input would have exactly one solution, and you may not use the same element twice.

var twoSum = function(nums, target) {
    for (var i = 0; i < nums.length-1; i++) {
        for (var j = 1; i+j < nums.length; j++){
            if (nums[i] + nums[i+j] === target) {
                return [i, i+j]
            }
        }
    }
}
