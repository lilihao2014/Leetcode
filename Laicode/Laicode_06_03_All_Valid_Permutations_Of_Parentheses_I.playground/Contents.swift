/*
     Given N pairs of parentheses “()”, return a list with all the valid permutations.
 
     Assumptions
 
     N >= 0
     Examples
 
     N = 1, all valid permutations are ["()"]
     N = 3, all valid permutations are ["((()))", "(()())", "(())()", "()(())", "()()()"]
     N = 0, all valid permutations are [""]
 */



//public List<String> validParentheses(int n)

class solution {
    func validParentheses(_ n: Int) -> [String] {
        var res = [String]()
        var curr = [Character](repeating: ".", count: n * 2)
        helper(n, n, 0, &curr, &res)
        return res
    }
    
    func helper(_ left: Int, _ right: Int, _ index: Int, _ curr: inout [Character], _ res: inout [String]) {
        if left == 0 && right == 0 {
            res.append(String(curr))
            return
            
        }
        
        if left > 0 {
            curr[index] = "("
            helper(left - 1, right, index + 1, &curr, &res)
        }
        
        if right > left {
            curr[index] = ")"
            helper(left, right - 1, index + 1, &curr, &res)
        }
    }
    
    
}
