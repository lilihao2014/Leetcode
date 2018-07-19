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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil || q == nil {
            return p == nil && q == nil
        }
        var pQueue = [TreeNode]()
        var qQueue = [TreeNode]()
        pQueue.append(p!)
        qQueue.append(q!)
        while !pQueue.isEmpty && !qQueue.isEmpty {
            let pNode = pQueue.removeFirst()
            let qNode = qQueue.removeFirst()
            if pNode.val != qNode.val {
                return false
            }
            if pNode.left != nil && qNode.left != nil{
                pQueue.append(pNode.left!)
                qQueue.append(qNode.left!)
            }else if(pNode.left == nil && qNode.left == nil) {
                
            }else {
                return false
            }
            if pNode.right != nil && qNode.right != nil {
                pQueue.append(pNode.right!)
                qQueue.append(qNode.right!)
            }else if pNode.right == nil && qNode.right == nil {
                
            }else {
                return false
            }
        }
        return pQueue.isEmpty && qQueue.isEmpty
    }
}
