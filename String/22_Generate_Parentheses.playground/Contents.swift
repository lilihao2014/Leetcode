class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var res = [String]()
        var tmp = String()
        helper(tmp: &tmp, left: n, right: n, res: &res)
        return res
    }
    
    func helper(tmp: inout String, left: Int, right: Int, res: inout [String]) {
        if left == 0 && right == 0 {
            res.append(String(tmp))
            return
        }
        if left > 0 {
            tmp.append("(")
            helper(tmp: &tmp, left: left - 1, right: right, res: &res)
        }
        tmp.removeLast()
        if left > right {
            tmp.append(")")
            helper(tmp: &tmp, left: left, right: right - 1, res: &res)
        }
    }
}
