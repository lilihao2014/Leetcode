class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        var curr = [Int]()
        var numsArray = nums
        numsArray.sort(by:<)
        helper(0, &curr, &res, numsArray)
        return res
    }
    
    private func helper(_ index: Int, _ curr: inout [Int], _ res: inout [[Int]], _ nums: [Int]) {
        res.append(curr)
        for i in index..<nums.count {
            if i != index && nums[i] == nums[i - 1] {
                continue
            }
            curr.append(nums[i])
            helper(i + 1, &curr, &res, nums)
            curr.removeLast()
        }
    }
}
