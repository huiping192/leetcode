// Source : https://oj.leetcode.com/problems/roman-to-integer/
// Author : Huiping Guo
// Date   : 2020-11-25

/**********************************************************************************
*
* Given a roman numeral, convert it to an integer.
*
* Input is guaranteed to be within the range from 1 to 3999.
*
**********************************************************************************/


class Solution {
    func romanToInt(_ s: String) -> Int {
        var valueList = [Int]()
        var currentIndex = s.startIndex
        
        repeat {
            let currentVal: Int = convert(s[currentIndex])
            if currentIndex == s.index(before: s.endIndex) {
                valueList.append(currentVal)
                break
            }
            
            let nextIndex = s.index(after: currentIndex)
            let flag: Bool = judgePlusOrMinus(s[currentIndex], s[nextIndex])
            let trueValue = flag ? currentVal : -currentVal
            valueList.append(trueValue)
            currentIndex = nextIndex
            
        } while true
        
        return valueList.reduce(0, +)
    }
    
    func judgePlusOrMinus(_ firstChar: Character, _ secondChar: Character) -> Bool {
        return convert(firstChar) >= convert(secondChar)
    }
    
    func convert(_ s : Character) -> Int {
        switch s {
        case "I":
            return 1
        case "V":
            return 5
        case "X":
            return 10
        case "L":
            return 50
        case "C":
            return 100
        case "D":
            return 500
        case "M":
            return 1000
        default:
            fatalError()
        }
    }
}


let solution = Solution()

//Example 1:
//
//Input: s = "III"
//Output: 3

print(solution.romanToInt("III") == 3)

//Example 2:
//
//Input: s = "IV"
//Output: 4

print(solution.romanToInt("IV") == 4)

//Example 3:
//
//Input: s = "IX"
//Output: 9

print(solution.romanToInt("IX") == 9)

//Input: s = "LVIII"
//Output: 58
//Explanation: L = 50, V= 5, III = 3.
print(solution.romanToInt("LVIII") == 58)

//Example 5:
//
//Input: s = "MCMXCIV"
//Output: 1994
//Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
print(solution.romanToInt("MCMXCIV") == 1994)
