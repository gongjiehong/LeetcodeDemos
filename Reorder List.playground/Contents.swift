import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    func reorderList(_ head: ListNode?) {
        if head?.next == nil {
            return
        }
        let reversed = reverse(head)
        
        var left: ListNode? = head
        var right: ListNode? = reversed
        while let l = left, let r = right {
            if l.val < r.val {
                left?.next = right
            } else if l.val > r.val {
                right?.next = left
            } else {
                left?.next = nil
                right?.next = nil
                break
            }
            left = left?.next
            right = right?.next
        }
    }
    
    func reverse(_ head: ListNode?) -> ListNode? {
        var current: ListNode? = head
        var reversedList: ListNode?
        var next: ListNode? = nil
        
        while current != nil {
            next = current?.next
            current?.next = reversedList
            reversedList = current
            current = next
        }
        
        return reversedList
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
s.reorderList(linkedList)
s.printList(linkedList)
