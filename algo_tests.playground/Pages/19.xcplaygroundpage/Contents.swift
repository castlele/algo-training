import Foundation

public class ListNode: CustomStringConvertible {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }

    public var description: String {
        "(\(val)) -> " + (next?.description ?? "")
    }
}

class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        guard let head = head else {
            return nil
        }

        var newHead = revereseList(for: head)

        return nil
    }

    func revereseList(for head: ListNode) -> ListNode? {
        var mutableHead: ListNode? = head
        var tail: ListNode? = ListNode(head.val)

        while let next = mutableHead?.next {
            print(tail)
            mutableHead = mutableHead?.next
            next.next = tail
            tail = next
        }

        return tail
    }
}

let n5 = ListNode(5)
let n4 = ListNode(4, n5)
let n3 = ListNode(3, n4)
let n2 = ListNode(2, n3)
let n1 = ListNode(1, n2)

let sol = Solution().revereseList(for: n1)

print(sol)
