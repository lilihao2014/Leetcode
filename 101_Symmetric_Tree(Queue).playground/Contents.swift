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
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        var queue = [TreeNode]()
        queue.append(root)
        queue.append(root)
        while !queue.isEmpty {
            if queue.count % 2 != 0 {
                return false
            }
            let leftNode = queue.removeFirst()
            let rightNode = queue.removeFirst()
            guard leftNode.val == rightNode.val else {
                return false
            }
            if leftNode.left != nil {
                guard  rightNode.right != nil else {
                    return false;
                }
                queue.append(leftNode.left!)
                queue.append(rightNode.right!)
            }else if rightNode.right != nil {
                return false;
            }
            
            if leftNode.right != nil {
                guard rightNode.left != nil else {
                    return false
                }
                queue.append(leftNode.right!)
                queue.append(rightNode.left!)
            }else if rightNode.left != nil {
                return false
            }
        }
        return true
    }
}
