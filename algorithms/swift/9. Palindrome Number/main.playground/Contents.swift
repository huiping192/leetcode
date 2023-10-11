/**
 
 Given an integer x, return true if x is a
 palindrome
 , and false otherwise.
 
 
 
 Example 1:
 
 Input: x = 121
 Output: true
 Explanation: 121 reads as 121 from left to right and from right to left.
 Example 2:
 
 Input: x = -121
 Output: false
 Explanation: From left to right, it reads -121. From right to left, it becomes 121-. Therefore it is not a palindrome.
 Example 3:
 
 Input: x = 10
 Output: false
 Explanation: Reads 01 from right to left. Therefore it is not a palindrome.
 
 
 Constraints:
 
 -231 <= x <= 231 - 1
 
 
 Follow up: Could you solve it without converting the integer to a string?
 */

class Solution {
  func isPalindrome(_ x: Int) -> Bool {
    if x == 0 { return true }
    if x < 0 { return false }
    if x % 10 == 0 { return false }
    
    var value = x`
    var reverseValue = 0
    
    while value > reverseValue {
      reverseValue = reverseValue * 10 + value % 10
      value = value / 10
    }
    
    return value == reverseValue || value == reverseValue / 10
  }
}

let test = Solution()

print(test.isPalindrome(121) == true)
print(test.isPalindrome(-121) == false)
print(test.isPalindrome(10) == false)

print(test.isPalindrome(1221) == true)
