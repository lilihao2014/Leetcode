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
    var maxValue = Int.min
    func maxPathSum(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        maxValue = root.val
        helper(root)
        return maxValue
    }
    
    private func helper(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var leftValue = 0, rightValue = 0
        if root.left != nil {
            leftValue = helper(root.left)
        }
        if root.right != nil {
            rightValue = helper(root.right)
        }
        leftValue = leftValue > 0 ? leftValue : 0
        rightValue = rightValue > 0 ? rightValue : 0
        if leftValue + root.val + rightValue > maxValue {
            maxValue = leftValue + root.val + rightValue
        }
        return max(root.val + leftValue, root.val + rightValue)
    }
}
