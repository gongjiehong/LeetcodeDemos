import UIKit


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
class Solution {
    func reverseList(_ head: ListNode?) -> ListNode? {
        var current = head
        var next: ListNode? = nil
        var reversedList: ListNode? = nil
        
        while current != nil {
            // 先保存后续节点
            next = current?.next
            
            // 当前节点的后续节点为翻转后的链表，第一次为nil，刚好把尾节点next置为nil
            current?.next = reversedList
            
            // 执行翻转后赋值
            reversedList = current
            
            // 如果还不到尾节点，继续下一次循环
            current = next
        }
        
        return reversedList
        
    }
//    func reverseList(_ head: ListNode?) -> ListNode? {
//        guard head?.next != nil else {
//            return head
//        }
//
//        let last = reverseList(head?.next)
//        head?.next?.next = head
//        head?.next = nil
//        return last
//    }
//
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
s.printList(s.reverseList(linkedList))
