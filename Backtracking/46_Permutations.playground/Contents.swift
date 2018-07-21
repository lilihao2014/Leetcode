class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var numsArray = nums
        helper(0, &numsArray, &res)
        return res
    }
    
    private func helper(_ index: Int, _ nums: inout [Int], _ res: inout [[Int]]) {
        if index == nums.count {
            res.append(nums)
            return
        }
        
        for i in index..<nums.count {
            nums.swapAt(index, i)
            helper(index + 1, &nums, &res)
            nums.swapAt(index, i)
        }
    }
}
