import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
//    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
//        // 新的头结点
//        var newHead: ListNode? = nil
//
//        // 存储上一个有效节点
//        var validNode: ListNode? = nil
//
//        // 前序节点
//        var pre: ListNode? = nil
//
//        // 当前节点
//        var current: ListNode? = head
//
//        // 当前后续节点
//        var next: ListNode? = head?.next
//
//        // 当前节点不为空
//        while let temp = current {
//            // 一个节点跟前后都不相当，说明是有效节点
//            if pre?.val != current?.val, current?.val != next?.val {
//                // 生成新节点
//                let newNode = ListNode(temp.val)
//                // 赋值给新头
//                if newHead == nil {
//                    newHead = newNode
//                } else {
//                    // 有新头了，连接新节点
//                    validNode?.next = newNode
//                }
//                // 上一个有效节点存起来
//                validNode = newNode
//            }
//
//            // 节点整体后移
//            pre = current
//            current = next
//            next = current?.next
//        }
//        return newHead
//    }
    
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        // 用来保存新头结点的
        let holder = ListNode(-1)
        
        // 慢指针
        var slow: ListNode? = holder
        
        // 快指针
        var fast: ListNode? = head
        
        repeat {
            // 如果没到末尾，且出现了相邻两值相等，找到不相等的指针为止
            if let temp = fast, temp.val == temp.next?.val {
                // while 循环只能找到相等的最后一个节点
                while fast?.val == fast?.next?.val {
                    fast = fast?.next
                }
                // fast?.next为后一个不相等的节点
                fast = fast?.next
            } else {
                // 不和后一个节点相等了，说明为有效节点，复制给慢指针的后续节点
                slow?.next = fast
                
                // slow 后移，用于接收下一个节点
                slow = slow?.next
                
                // fast 后移，继续查找重复
                fast = fast?.next
            }
        } while slow != nil
        
        // 返回holder持有的头结点
        return holder.next
    }
    
    func printList(_ head: ListNode?) {
        guard let head = head else {
            return
        }
        
        print(head.val)
        printList(head.next)
    }
}


let linkedList = ListNode(1, ListNode(2, ListNode(2, ListNode(3, ListNode(4)))))

let s = Solution()
s.printList(s.deleteDuplicates(linkedList))
