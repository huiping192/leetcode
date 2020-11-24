
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


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var result: ListNode?
        
        var list1 = l1
        var list2 = l2
        
        var currentNode: ListNode?
        var needPlus1 = false
        
        repeat {
            var sum = (list1?.val ?? 0) + (list2?.val ?? 0)
            if needPlus1 {
                sum += 1
            }
            
            
            let node = ListNode(sum % 10)
            
            if result == nil {
                result = node
            } else {
                currentNode?.next = node
            }
            
            currentNode = node
            
            needPlus1 = sum >= 10
            
            list1 = list1?.next
            list2 = list2?.next
        } while list1 != nil || list2 != nil
        
        
        if needPlus1 {
            currentNode?.next = ListNode(1)
        }
        
        return result
    }
}

let solution = Solution()

func covert(_ list: [Int]) -> ListNode? {
    let nodeList = list.map({ ListNode($0) })
    
    for (index,val) in nodeList.enumerated() {
        if index + 1 == nodeList.count { break }
        val.next = nodeList[index + 1]
    }
    
    return nodeList.first
}


func covert(_ node: ListNode?) -> [Int] {
    guard let node = node else { return []}
    
    var list = [Int]()
    
    var currentNode: ListNode? = node
    
    repeat {
        guard let node = currentNode else { break }
        list.append(node.val)
        currentNode = node.next
    } while currentNode != nil
    
    return list
}

//
//Example 1:
//Input: l1 = [2,4,3], l2 = [5,6,4]
//Output: [7,0,8]
//Explanation: 342 + 465 = 807.

print(covert(solution.addTwoNumbers(covert([2,4,3]),covert([5,6,4]))) == [7,0,8])

//Example 2:
//
//Input: l1 = [0], l2 = [0]
//Output: [0]

print(covert(solution.addTwoNumbers(covert([0]),covert([0]))) == [0])


//Example 3:
//
//Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
//Output: [8,9,9,9,0,0,0,1]

print(covert(solution.addTwoNumbers(covert([9,9,9,9,9,9,9]),covert([9,9,9,9]))) == [8,9,9,9,0,0,0,1])
