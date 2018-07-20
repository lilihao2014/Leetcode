public class TreeNode {
    var left: TreeNode?
    var right: TreeNode?
    var val: Int
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return helper(nums, 0, nums.count - 1)
    }
    
    func helper(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
        if left > right {
            return nil
        }
        let mid = left + (right - left) / 2
        let root = TreeNode(nums[mid])
        let leftNode = helper(nums, left, mid - 1)
        let rightNode = helper(nums, mid + 1, right)
        root.left = leftNode
        root.right = rightNode
        return root
    }
    
    func test() {
        let nums = [-10, -3, 0, 5, 9]
        let root = sortedArrayToBST(nums)
        print(root?.val ?? -1)
    }
    
}
