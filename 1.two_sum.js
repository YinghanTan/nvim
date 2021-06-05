/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */
var twoSum = function (nums, target) {
  for (let i = 0, len = nums.length; i < len; i++) {
    for (let j = 0, len = nums.length; j < len; j++) {
      if (nums[i] + nums[j] == target) {
        return [i, j];
      }
    }
  }
};
