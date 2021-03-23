import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


class Solution {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        if left == 1 {
            // base case left==1的时候降级为翻转head开头的前n个节点
            return reverseFirstN(head, right)
        } else {
            // 这里递归直到left == 1，前面的操作不会执行翻转操作，知道变为base case
            head?.next = reverseBetween(head?.next, left - 1, right - 1)
            return head
        }
    }
    
    func reverseFirstN(_ head: ListNode?, _ n: Int) -> ListNode? {
        // 用于存储开始时的头结点，最后用next指针连接后面没有翻转的部分
        let oldHead = head
        
        // 当前节点
        var current: ListNode? = head
        
        // 存储下一节点指针
        var next: ListNode? = nil
        
        // 反转部分
        var reversedList: ListNode? = nil
        
        // 到第n个节点标记
        var index = 0
        
        while current != nil {
            // 记录下一节点，后续使用
            next = current?.next
            
            // 反转操作，next等于反转后的头结点
            current?.next = reversedList
            
            // 记录反转后的头结点
            reversedList = current
            
            // 更换current，继续循环
            current = next
            
            // 标记后移
            index += 1
            
            if n == index {
                // 标记移动到了指定位置，反转后oldhead实际上成乐tail节点，这里连接next，循环结束
                oldHead?.next = next
                break
            }
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
s.printList(s.reverseBetween(linkedList, 1, 4))
