import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
//    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
//        // k == 0 或者只有一个节点，或者直接节点为空，不翻转直接返回
//        if k == 0 || head?.next == nil {
//            return head
//        }
//
//        var array = [Int]()
//        var next = head
//        while let temp = next {
//            array.append(temp.val)
//            next = temp.next
//        }
//
//        let length = array.count
//
//        let index = k % length
//
//        // index == 0 相当于k等于0
//        if index == 0 {
//            return head
//        }
//
//        let leftArray = [Int](array[0...(length - index - 1)])
//        let rightArray = [Int](array[(length - index)...(length - 1)])
//
//        var newHead: ListNode?
//        next = nil
//
//        if rightArray.count > 0 {
//            if newHead == nil {
//                newHead = ListNode(rightArray[0])
//                next = newHead
//            }
//
//            if rightArray.count > 1 {
//                for temp in 1..<rightArray.count {
//                    let node = ListNode(rightArray[temp])
//                    next?.next = node
//                    next = node
//                }
//            }
//        }
//
//        if leftArray.count > 0 {
//            if newHead == nil {
//                newHead = ListNode(leftArray[0])
//                next = newHead
//                if leftArray.count > 1 {
//                    for temp in 1..<leftArray.count {
//                        let node = ListNode(leftArray[temp])
//                        next?.next = node
//                        next = node
//                    }
//                }
//            } else {
//                for temp in 0..<leftArray.count {
//                    let node = ListNode(leftArray[temp])
//                    next?.next = node
//                    next = node
//                }
//            }
//        }
//        return newHead
//    }
//
    
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        // k == 0 或者只有一个节点，或者直接节点为空，不翻转直接返回
        if k == 0 || head?.next == nil {
            return head
        }
        
        // 计算链表长度
        var deepth = 1
        var current: ListNode? = head
        while let next = current?.next {
            deepth += 1
            current = next
        }
        
        // 计算翻转位置，如果为0表示不翻转
        let index = k % deepth
        if index == 0 {
            return head
        }
        
        // kNode，开始翻转的节点
        var kNode: ListNode? = head
        // 从左边开始的长度
        var length = deepth - index - 1
        
        var rightPart: ListNode?
        while kNode?.next != nil {
            if length == 0 {
                // 找到对应节点，将后面断开
                rightPart = kNode?.next
                kNode?.next = nil
                break
            }
            kNode = kNode?.next
            length -= 1
        }
        
        // 上面的current实际上已经走到了尾节点，在找knode的时候已经把链表断开为两部分，这里重新连接即可
        current?.next = head
        
        return rightPart
    }
    
    func printList(_ head: ListNode?) {
        guard let head = head else {
            return
        }
        
        print(head.val)
        printList(head.next)
    }
}

let linkedList = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5, nil)))))


let solution = Solution()
let res = solution.rotateRight(linkedList, 2)
solution.printList(res)
