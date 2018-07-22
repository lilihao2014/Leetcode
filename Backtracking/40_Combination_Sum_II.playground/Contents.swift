class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res = [[Int]]()
        var curr = [Int]()
        var canCopy = candidates
        canCopy.sort(by: <)
        helper(0, target, &curr, &res, canCopy)
        return res
    }
    
    private func helper(_ index: Int, _ target: Int, _ curr: inout [Int], _ res: inout [[Int]], _ candidates: [Int]) {
        if target == 0 {
            res.append(curr)
            return
        }else if target < 0 {
            return
        }
        for i in index..<candidates.count {
            if i != index && candidates[i] == candidates[i - 1] {
                continue
            }
            if candidates[i] > target {
                return
            }
            curr.append(candidates[i])
            helper(i + 1, target - candidates[i], &curr, &res, candidates)
            curr.removeLast()
        }
    }
}
