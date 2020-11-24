// Source : https://oj.leetcode.com/problems/two-sum/
// Author : Huiping Guo
// Date   : 2020-11-23

/**********************************************************************************
*
* Given an array of integers, find two numbers such that they add up to a specific target number.
*
* The function twoSum should return indices of the two numbers such that they add up to the target,
* where index1 must be less than index2. Please note that your returned answers (both index1 and index2)
* are not zero-based.
*
* You may assume that each input would have exactly one solution.
*
* Input: numbers={2, 7, 11, 15}, target=9
* Output: index1=1, index2=2
*
*
**********************************************************************************/


class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result: [Int] = [0,0]
        
        for (index,num) in nums.enumerated() {
            let diff = target - num
            
            guard let j = nums.firstIndex(of: diff) else {
                continue
            }
            
            if j != index {
                result[0] = index
                result[1] = j
                break
            }
            
            guard let secondIndexs = nums.lastIndex(of: diff),  secondIndexs != index else {
                continue
            }
            result[0] = index
            result[1] = secondIndexs
            
            break;
        }
        
        return result
    }
}


let solution = Solution()

//Example 1:
//
//Input: nums = [2,7,11,15], target = 9
//Output: [0,1]
//Output: Because nums[0] + nums[1] == 9, we return [0, 1].

print(solution.twoSum([2,7,11,15],9) == [0, 1])

//Example 2:
//
//Input: nums = [3,2,4], target = 6
//Output: [1,2]

print(solution.twoSum([3,2,4],6) == [1,2])



//Example 3:

//Input: nums = [3,3], target = 6
//Output: [0,1]

print(solution.twoSum([3,3],6) == [0,1])
