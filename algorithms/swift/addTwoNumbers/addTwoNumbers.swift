
// Source : https://oj.leetcode.com/problems/add-two-numbers/
// Author : Huiping Guo
// Date   : 2020-11-23

/**********************************************************************************
*
* You are given two linked lists representing two non-negative numbers.
* The digits are stored in reverse order and each of their nodes contain a single digit.
* Add the two numbers and return it as a linked list.
*
* Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
* Output: 7 -> 0 -> 8
*
**********************************************************************************/

/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */

func addTwoNumbers(_ list1: [Int], _ list2: [Int]) -> [Int] {
    let firstList: [Int]
    let secondList: [Int]
    
    if list1.count >= list2.count {
        firstList = list1
        secondList = list2
    } else {
        firstList = list2
        secondList = list1
    }
    
    var result = [Int]()
    
    var needPlus1 = false
    
    for (index,value) in firstList.enumerated() {
        if index >= secondList.count {
            let sum = needPlus1 ? value + 1: value
            result.append(sum % 10)
            needPlus1 = sum >= 10
            continue
        }
        
        var sum = value + secondList[index]
        if needPlus1 {
            sum += 1
        }
        result.append(sum % 10)
        needPlus1 = sum >= 10
    }
    
    if needPlus1 {
        result.append(1)
    }
    
    return result
}

//
//Example 1:
//Input: l1 = [2,4,3], l2 = [5,6,4]
//Output: [7,0,8]
//Explanation: 342 + 465 = 807.


print(addTwoNumbers([2,4,3],[5,6,4]) == [7,0,8])

//Example 2:
//
//Input: l1 = [0], l2 = [0]
//Output: [0]

print(addTwoNumbers([0],[0]) == [0])


//Example 3:
//
//Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
//Output: [8,9,9,9,0,0,0,1]

print(addTwoNumbers([9,9,9,9,9,9,9],[9,9,9,9]) == [8,9,9,9,0,0,0,1])
