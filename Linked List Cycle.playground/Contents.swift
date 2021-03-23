import UIKit


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow: ListNode? = head
        var fast: ListNode? = head?.next
        
        while fast?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
            
            if fast === slow {
                return true
            }
        }
        return false
    }
    
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        guard let head = head else {
            return nil
        }
        
        // 前序节点
        var pre: ListNode? = head
        
        // 当前节点
        var current: ListNode? = head
        
        while let next = current?.next {
            if next.val == current?.val {
                // 如果当前节点和后续节点相等，把当前节点的next置空（断开链表），然后把后续节点作为当前节点，中间节点舍掉
                current?.next = nil
                current = next
            } else {
                current = next
                pre?.next = next
                pre = next
            }
        }
        
        return head
    }
    
    func printList(_ head: ListNode?) {
        guard let head = head else {
            return
        }
        
        print(head.val)
        printList(head.next)
    }
}

let linkedList = ListNode(1, ListNode(1, ListNode(2, ListNode(3, ListNode(3, ListNode(3, ListNode(4)))))))

let s = Solution()
s.printList(s.deleteDuplicates(linkedList))
