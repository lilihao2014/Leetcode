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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        return helper(preorder, inorder, 0, 0, inorder.count - 1)
    }
    
    func helper(_ preorder: [Int], _ inorder: [Int], _ preorderStart: Int, _ inorderStart: Int, _ inorderEnd: Int) -> TreeNode? {
        if preorderStart >= preorder.count || inorderStart > inorderEnd {
            return nil
        }
        var index = -1
        for i in inorderStart...inorderEnd {
            if inorder[i] == preorder[preorderStart] {
                index = i
                break
            }
        }
        let root = TreeNode(preorder[preorderStart])
        root.left = helper(preorder, inorder, preorderStart + 1, inorderStart, index - 1)
        root.right = helper(preorder, inorder, preorderStart + index - inorderStart + 1, index + 1, inorderEnd)
        return root
    }
}
