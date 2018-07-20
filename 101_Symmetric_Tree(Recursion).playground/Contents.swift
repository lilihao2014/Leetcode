public class TreeNode {
    var left: TreeNode?
    var right: TreeNode?
    var val: Int
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        return helper(root, root)
    }
    
    func helper(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil || q == nil {
            return p == nil && q == nil
        }else if p!.val != q!.val {
            return false
        }
        return helper(p!.left, q!.right) && helper(p!.right, q!.left)
    }
}
