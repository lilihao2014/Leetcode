class TreeNode {
    var left: TreeNode?
    var right: TreeNode?
    var val: Int
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

public class Solution {
    func isBST(_ root: TreeNode?) -> Bool {
        return helper(root, Int.min, Int.max)
    }
    
    func helper(_ root: TreeNode?, _ min: Int, _ max: Int) -> Bool {
        guard let root = root else {
            return true
        }
        
        if root.val < min || root.val > max {
            return false
        }
        
        return helper(root.left, min, root.val) && helper(root.right, root.val, max)
    }
    
}
