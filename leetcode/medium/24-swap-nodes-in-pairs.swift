 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }

class Solution {
    func swapPairs(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head

        var prev: ListNode? = dummy
        var curr: ListNode? = head

        while let node1 = curr, let node2 = curr?.next {
            let next = node2.next

            node2.next = node1
            node1.next = next
            prev?.next = node2

            prev = node1
            curr = next
        }

        return dummy.next
    }
}
