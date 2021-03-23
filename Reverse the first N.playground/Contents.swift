import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
//    func reverseFirstN(_ head: ListNode?, _ n: Int) -> ListNode? {
//        let oldHead = head
//        var current = head
//        var reversed: ListNode? = nil
//        var index = 0
//        var next: ListNode? = nil
//
//
//        while current != nil {
//            next = current?.next
//            current?.next = reversed
//            reversed = current
//            current = next
//
//            index += 1
//            if index == n {
//                oldHead?.next = next
//                break
//            }
//        }
//
//        return reversed
//    }
    
    var successor: ListNode? = nil
    
    func reverseFirstN(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        let nodes = [ListNode]()
        nodes.contains { (node) -> Bool in
            return node.val == head?.val
        }
        if n == 1 {
            successor = head?.next
            return head
        }
        
        let last = reverseFirstN(head?.next, n - 1)
        head?.next?.next = head
        head?.next = successor
        return last
    }
    
    func printList(_ head: ListNode?) {
        guard let head = head else {
            return
        }
        
        print(head.val)
        printList(head.next)
    }
}


let linkedList = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))


let s = Solution()
s.printList(s.reverseFirstN(linkedList, 4))
