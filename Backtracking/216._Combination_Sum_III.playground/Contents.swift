class Solution {
    func combinationSum3(_ k: Int, _ n: Int) -> [[Int]] {
        var res = [[Int]]()
        var curr = [Int]()
        helper(k, n, 1, &curr, &res)
        return res
    }
    
    private func helper(_ maximumCount: Int, _ target: Int, _ index: Int, _ curr: inout [Int], _ res: inout [[Int]]) {
        if target < 0 || maximumCount < curr.count {
            return
        }
        if target == 0 && maximumCount == curr.count {
            res.append(curr)
            return
        }else if target != 0 && maximumCount == curr.count {
            return
        }else {
            for i in index..<10 {
                curr.append(i)
                helper(maximumCount, target - i, i + 1, &curr, &res)
                curr.removeLast()
            }
        }
    }
}

