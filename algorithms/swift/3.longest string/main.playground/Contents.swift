/**
 
 Given a string s, find the length of the longest
 substring
 without repeating characters.
 
 
 
 Example 1:
 
 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:
 
 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:
 
 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
 
 
 Constraints:
 
 0 <= s.length <= 5 * 104
 s consists of English letters, digits, symbols and spaces.
 
 */


func lengthOfLongestSubstring(_ s: String) -> Int {
  var maxCount = 0
  
  var start = 0
  var dic: [Character: Int] = [:]
  
  for (index, char) in s.enumerated() {
    if let preiousIndex = dic[char], preiousIndex >= start {
      start = preiousIndex + 1
    }
    
    dic[char] = index
    
    maxCount = max(maxCount, index - start + 1)
  }
  
  return maxCount
}


if lengthOfLongestSubstring("abcabcbb") == 3 {
  print("Test 1 passed")
} else {
  print("Test 1 failed")
}


if lengthOfLongestSubstring("bbbbb") == 1 {
  print("Test 2 passed")
} else {
  print("Test 2 failed")
}


if lengthOfLongestSubstring("pwwkew") == 3 {
  print("Test 3 passed")
} else {
  print("Test 3 failed")
}

if lengthOfLongestSubstring(" ") == 1 {
  print("Test 4 passed")
} else {
  print("Test 4 failed")
}

if lengthOfLongestSubstring("au") == 2 {
  print("Test 5 passed")
} else {
  print("Test 5 failed")
}


if lengthOfLongestSubstring("dvdf") == 3 {
  print("Test 6 passed")
} else {
  print("Test 6 failed")
}
