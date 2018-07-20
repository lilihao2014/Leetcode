public class TreeNode {
    public var left: TreeNode?
    public var right: TreeNode?
    public var val: Int
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func constructMaximumBinaryTree(_ nums: [Int]) -> TreeNode? {
        return helper(nums, 0, nums.count - 1)
    }
    
    private func helper(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right {
            return nil
        }
        let maxIndex = findMaxIndex(nums, left, right)
        let root = TreeNode(nums[maxIndex])
        root.left = TreeNode(nums[findMaxIndex(nums, left, maxIndex - 1)])
        root.right = TreeNode(nums[findMaxIndex(nums, maxIndex + 1, right)])
        return root
    }
    
    private func findMaxIndex(_ nums: [Int], _ left: Int, _ right: Int) -> Int {
        var index = left
        for i in left + 1...right {
            index = nums[i] > nums[index] ? i : index
        }
        return index
    }
}
