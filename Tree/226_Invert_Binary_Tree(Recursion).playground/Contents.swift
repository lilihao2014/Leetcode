public class TreeNode {
    public var left: TreeNode?
    public var right: TreeNode?
    public var val: Int
    public init(_ val: Int) {
        self.val = val;
        self.left = nil
        self.right = nil
    }
}

class solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil;
        }
        let tmp = root.left
        root.left = root.right
        root.right = tmp
        invertTree(root.left)
        invertTree(root.right)
        return root
    }
}
