class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var curr = [Int]()
        helper(0, &curr, &res, nums)
        return res
    }
    
    private func helper(_ index: Int, _ curr: inout [Int], _ res: inout [[Int]], _ nums: [Int]) {
        res.append(curr)
        for i in index..<nums.count {
            curr.append(nums[i])
            helper(i + 1, &curr, &res, nums)
            curr.removeLast()
        }
    }
}
