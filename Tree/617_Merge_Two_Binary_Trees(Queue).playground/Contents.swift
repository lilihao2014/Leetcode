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
    func mergeTrees(_ t1: TreeNode?, _ t2: TreeNode?) -> TreeNode? {
        guard let t1 = t1 else {
            return t2
        }
        guard let t2 = t2 else {
            return t1
        }
        var queue = [[TreeNode?]]()
        queue.append([t1, t2])
        while !queue.isEmpty {
            let curr = queue.removeFirst()
            guard let _ = curr[1] else {
                continue
            }
            curr[0]?.val += curr[1]!.val
            if curr[0]?.left == nil {
                curr[0]?.left = curr[1]!.left
            }else {
                queue.append([curr[0]?.left, curr[1]?.left])
            }
            
            if curr[0]?.right == nil {
                curr[0]?.right = curr[1]!.right
            }else {
                queue.append([curr[0]?.right, curr[1]!.right])
            }
        }
        return t1
    }
}
