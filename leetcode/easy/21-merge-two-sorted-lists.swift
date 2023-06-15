public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


class Solution {
    func mergeTwoListsFirstSolution(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard let list1 = list1 else {
            return list2
        }

        guard let list2 = list2 else {
            return list1
        }

        var head = ListNode()
        var head1: ListNode?
        var head2: ListNode?

        if list1.val <= list2.val {
            head.val = list1.val
            head1 = list1.next
            head2 = list2
        } else {
            head.val = list2.val
            head1 = list1
            head2 = list2.next
        }

        var curr = head

        while let h1 = head1, let h2 = head2 {
            if h1.val <= h2.val {
                curr.next = ListNode(h1.val)
                head1 = h1.next
            } else {
                curr.next = ListNode(h2.val)
                head2 = h2.next
            }

            curr = curr.next!
        }

        if let h1 = head1 {
            curr.next = h1
        }

        if let h2 = head2 {
            curr.next = h2
        }

        return head
    }

    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        guard let list1 = list1 else {
            return list2
        }

        guard let list2 = list2 else {
            return list1
        }

        var l1 = list1
        var l2 = list2
        var head: ListNode?
        var tail: ListNode?

        while true {
            let (curr, other) = l1.val <= l2.val ? (l1, l2) : (l2, l1)
            let next = curr.next
            curr.next = nil

            if tail == nil {
                head = curr
                tail = head

            } else {
                tail?.next = curr
                tail = tail?.next
            }

            if next == nil {
                tail?.next = other
                break
            }

            l1 = next!
            l2 = other
        }

        return head
    }
}
