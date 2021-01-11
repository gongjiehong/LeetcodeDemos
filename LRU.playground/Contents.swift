import UIKit

public protocol LGMemoryCost {
    /// 获取实际内存占用大小，结果可能稍有偏差
    ///
    /// - Returns: 实际占用大小
    func memoryCost() -> UInt64
}

public final class LGLinkedList<KeyType: Hashable, ValueType: LGMemoryCost> {
    public class LinkedListNode {
        weak var previous: LinkedListNode?
        weak var next: LinkedListNode?
        var key: KeyType
        var value: ValueType
        var memoryCost: UInt64
        var modifyTime: TimeInterval
        
        public init(key: KeyType, value: ValueType, modifyTime: TimeInterval = 0.0) {
            self.key = key
            self.value = value
            self.memoryCost = value.memoryCost()
            self.modifyTime = modifyTime
        }
        
        static func == (lhs: LGLinkedList.LinkedListNode, rhs: LGLinkedList.LinkedListNode?) -> Bool {
            return lhs.key == rhs?.key
        }
        
        static func == (lhs: LGLinkedList.LinkedListNode?, rhs: LGLinkedList.LinkedListNode) -> Bool {
            return lhs?.key == rhs.key
        }
        
        static func != (lhs: LGLinkedList.LinkedListNode, rhs: LGLinkedList.LinkedListNode?) -> Bool {
            return lhs.key != rhs?.key
        }
        
        static func != (lhs: LGLinkedList.LinkedListNode?, rhs: LGLinkedList.LinkedListNode) -> Bool {
            return lhs?.key != rhs.key
        }
    }
    
    public typealias Node = LinkedListNode
        
    public private(set) var totalCost: UInt64 = 0
    public private(set) var totalCount: UInt64 = 0

    public private(set) var head: Node!
    public private(set) var tail: Node!
    
    public init(head: Node, tail: Node) {
        head.next = tail
        tail.previous = head
        self.head = head
        self.tail = tail
    }
    
    public func addLast(_ node: Node) {
        node.previous = tail.previous
        node.next = tail
        tail.previous?.next = node
        tail.previous = node
        totalCount += 1
        totalCost += node.memoryCost
    }
    
    public func remove(_ node: Node) {
        node.previous?.next = node.next
        node.next?.previous = node.previous
        totalCount -= 1
        totalCost -= node.memoryCost
    }
    
    public func removeFirst() -> Node? {
        guard head.next != tail, let first = head.next else {
            return nil
        }
        remove(first)
        return first
    }
}


public class
