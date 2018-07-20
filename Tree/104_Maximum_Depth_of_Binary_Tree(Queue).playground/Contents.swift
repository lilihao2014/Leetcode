public class TreeNode {
    public var left: TreeNode?
    public var right: TreeNode?
    public var value: Int
    public init(_ value: Int) {
        self.value = value
        self.left = nil
        self.right = nil
    }
}

class solution {
    func maxDepth(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var queue = [TreeNode]()
        queue.append(root)
        var height = 0
        while queue.count != 0 {
            let size = queue.count
            for _ in 0..<size {
                let currNode = queue.removeFirst()
                if let leftNode = currNode.left {
                    queue.append(leftNode)
                }
                if let rightNode = currNode.right {
                    queue.append(rightNode)
                }
            }
            height += 1
        }
        return height
    }
}
