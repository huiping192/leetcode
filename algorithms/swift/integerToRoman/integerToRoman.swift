class Solution {
    func intToRoman(_ num: Int) -> String {
        if let a = connumert(num) {
            return String(a)
        }
        
        let a = test(num: num)
        
        let haha = a.1! - num
        if let smallNum = connumert(haha) {
            return String([smallNum,connumert(a.1!)!])
        }
       
        let b = num / a.0
        let c = (0..<b).map({ _ in connumert(a.0)! })
            
        let d = test2(b % a.0)
        
        return String(c + (d ?? []))
    }
    
    func test2(_ num: Int) -> [Character]? {
        let a = test(num: num)
        
        let haha = a.1! - num
        if let smallNum = connumert(haha) {
            return [smallNum,connumert(a.1!)!]
        }
       
        let b = num / a.0
        let c = (0..<b).map({ _ in connumert(a.0)! })
        
        return c + (test2(num % a.0) ?? [])
    }
    
    
    func test(num: Int) -> (Int,Int?) {
        if num > 1 && num < 5 {
            return (1,5)
        }
        
        if num > 5 && num < 10 {
            return (5,10)
        }
        
        if num > 10 && num < 50 {
            return (10,50)
        }
        
        if num > 50 && num < 100 {
            return (50,100)
        }
        
        if num > 100 && num < 500 {
            return (100,500)
        }
        
        if num > 500 && num < 1000 {
            return (500,1000)
        }
        
        return (1000, nil)
    }
}




func connumert(_ num : Int) -> Character? {
    switch num {
    case 1:
        return "I"
    case 5:
        return "V"
    case 10:
        return "X"
    case 50:
        return  "L"
    case 100:
        return  "C"
    case 500:
        return  "D"
    case 1000:
        return  "M"
    default:
        return nil
    }
}



let solution = Solution()


//print(solution.intToRoman(3))

print(solution.intToRoman(4))


print(solution.intToRoman(9))

print(solution.intToRoman(11))
