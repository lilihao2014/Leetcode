class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        var res = [[Int]]()
        var curr = [Int]()
        helper(0, target, &curr, &res, candidates)
        return res
    }
    
    private func helper(_ index: Int, _ target: Int, _ curr: inout [Int], _ res: inout [[Int]], _ candidate: [Int]) {
        if target == 0 {
            res.append(curr)
            return
        }else if(target < 0) {
            return;
        }
        
        for i in index..<candidate.count {
            if i != index && candidate[i] == candidate[i - 1] {
                continue
            }
            curr.append(candidate[i])
            helper(i, target - candidate[i], &curr, &res, candidate)
            curr.removeLast()
        }
    }
}
