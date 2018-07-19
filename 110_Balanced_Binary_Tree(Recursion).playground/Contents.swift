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
    func  isBalanced(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        return helper(root) != -1
    }
    
    private func helper(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        let leftHeight = helper(root.left)
        if leftHeight == -1 {
            return -1
        }
        let rightHeight = helper(root.right)
        if rightHeight == -1 {
            return -1
        }
        if abs(leftHeight - rightHeight) > 1 {
            return -1
        }
        return max(leftHeight, rightHeight) + 1
    }
}
