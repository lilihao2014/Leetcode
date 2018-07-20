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

func findLowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let root = root else {
        return nil
    }
    guard let p = p else {
        return q
    }
    guard let q = q else {
        return p
    }
    if p.val < root.val && q.val < root.val {
        return findLowestCommonAncestor(root.left, p, q)
    }else if p.val > root.val && q.val > root.val {
        return findLowestCommonAncestor(root.right, p, q)
    }
    return root
}

let node0 = TreeNode(6)

let node1 = TreeNode(2)
let node2 = TreeNode(8)

let node3 = TreeNode(0)
let node4 = TreeNode(4)
let node5 = TreeNode(7)
let node6 = TreeNode(9)

let node7 = TreeNode(3)
let node8 = TreeNode(5)

node0.left = node1
node0.right = node2

node1.left = node3
node1.right = node4
node2.left = node5
node2.right = node6

node4.left = node7
node4.right = node8

findLowestCommonAncestor(node0, node8, node3)
