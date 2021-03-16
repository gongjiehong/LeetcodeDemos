import UIKit

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

///// 前序遍历解法
//class Codec {
//    func serialize(_ root: TreeNode?) -> String {
//        // 用于存储前序遍历结果，null表示空值
//        var serializeArray = [String]()
//
//        // 前序遍历获取到前序序列
//        _serialize(root, &serializeArray)
//        let result = serializeArray.joined(separator: ",")
//        return result
//    }
//
//    private func _serialize(_ root: TreeNode?, _ resultArray: inout [String]) {
//        guard let root = root else {
//            resultArray.append("null")
//            return
//        }
//
//        resultArray.append("\(root.val)")
//
//        _serialize(root.left, &resultArray)
//        _serialize(root.right, &resultArray)
//    }
//
//    func deserialize(_ data: String) -> TreeNode? {
//        // 根据分隔符解析出前序遍历数组
//        var objArray = data.components(separatedBy: ",")
//        // 这里一定要保证每次遍历的remove成功，所以使用inout
//        return _deserialize(&objArray)
//    }
//
//    private func _deserialize(_ array: inout [String]) -> TreeNode? {
//        guard array.count > 0 else {
//            return nil
//        }
//
//        let first = array.removeFirst()
//        if first == "null" {
//            return nil
//        }
//
//        let node = TreeNode(Int(first) ?? 0)
//
//        node.left = _deserialize(&array)
//        node.right = _deserialize(&array)
//        return node
//    }
//}



/// 后序遍历解法，中序遍历由于无法获取准确的头结点索引，所以无法用中序进行序列化
//class Codec {
//    func serialize(_ root: TreeNode?) -> String {
//        var serializeArray = [String]()
//        pastTraversal(root, resultArray: &serializeArray)
//        return serializeArray.joined(separator: ",")
//    }
//
//    func pastTraversal(_ root: TreeNode?, resultArray: inout [String]) {
//        guard let root = root else {
//            resultArray.append("null")
//            return
//        }
//
//        pastTraversal(root.left, resultArray: &resultArray)
//        pastTraversal(root.right, resultArray: &resultArray)
//        resultArray.append("\(root.val)")
//    }
//
//    func deserialize(_ data: String) -> TreeNode? {
//        var serializeArray = data.components(separatedBy: ",")
//        return pastTraversalConstruct(array: &serializeArray)
//    }
//
//    func pastTraversalConstruct(array: inout [String]) -> TreeNode? {
//        guard array.count > 0 else {
//            return nil
//        }
//
//        let lastValue = array.removeLast()
//        if lastValue == "null" {
//            return nil
//        }
//
//        let root = TreeNode(Int(lastValue) ?? 0)
//        root.right = pastTraversalConstruct(array: &array)
//        root.left = pastTraversalConstruct(array: &array)
//        return root
//    }
//}

// 层级遍历解法
class Codec {
    func serialize(_ root: TreeNode?) -> String {
        var serilizedArray = [String]()
        traversal(root, resultArray: &serilizedArray)
        return serilizedArray.joined(separator: ",")
    }
    
    // 此处用数组实现的队列功能，可持有空节点
    struct NodeHolder {
        var node: TreeNode?
    }
    
    // 二叉树的层级遍历
    func traversal(_ root: TreeNode?, resultArray: inout [String]) {
        guard let root = root else {
            return
        }
        
        var queue = [NodeHolder]()
        queue.append(NodeHolder(node: root))
        
        while !queue.isEmpty {
            let current = queue.removeFirst()
            if let node = current.node {
                resultArray.append("\(node.val)")
            } else {
                // 终止条件，空节点，写入null
                resultArray.append("null")
                continue
            }
            queue.append(NodeHolder(node: current.node?.left))
            queue.append(NodeHolder(node: current.node?.right))
        }
    }

    func deserialize(_ data: String) -> TreeNode? {
        if data.count == 0 {
            return nil
        }
        
        let serilizedArray = data.components(separatedBy: ",")
        if serilizedArray.count == 0 {
            return nil
        }
        
        let root = TreeNode(Int(serilizedArray[0]) ?? 0)
        
        var queue = [TreeNode]()
        
        queue.append(root)
        
        var index = 1
        while index < serilizedArray.count {
            let parent = queue.removeFirst()
            
            let leftValue = serilizedArray[index]
            if leftValue != "null" {
                let temp = TreeNode(Int(leftValue) ?? 0)
                parent.left = temp
                queue.append(temp)
            } else {
                parent.left = nil
            }
            index += 1
            
            let rightValue = serilizedArray[index]
            if rightValue != "null" {
                let temp = TreeNode(Int(rightValue) ?? 0)
                parent.right = temp
                queue.append(temp)
            } else {
                parent.right = nil
            }
            index += 1
        }
        return root
    }

}



let tree = TreeNode(1,
                    TreeNode(2,
                             TreeNode(6),
                             nil),
                    TreeNode(3,
                             TreeNode(4),
                             TreeNode(5)))



Codec().deserialize(Codec().serialize(tree))

