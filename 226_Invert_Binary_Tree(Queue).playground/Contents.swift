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

class Solution {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        var array = [TreeNode]()
        array.append(root)
        while !array.isEmpty {
            let curr = array.removeFirst()
            let tmp = curr.left
            curr.left = curr.right
            curr.right = tmp
            if let left = curr.left {
                array.append(left)
            }
            if let right = curr.right {
                array.append(right)
            }
        }
        return root
    }
}
