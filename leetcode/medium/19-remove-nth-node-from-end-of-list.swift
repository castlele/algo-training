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
        var prev: ListNode?
        var curr = newHead

        for _ in 1..<n {
            prev = curr
            curr = curr?.next
        }

        prev == nil ? (newHead = newHead?.next) : (prev?.next = curr?.next)

        return revereseList(for: newHead)
    }

    func revereseList(for head: ListNode?) -> ListNode? {
        var curr: ListNode? = head
        var prev: ListNode?
        var next: ListNode?

        while curr != nil {
            next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }

        return prev
    }
}

let n5 = ListNode(5)
let n4 = ListNode(4, n5)
let n3 = ListNode(3, n4)
let n2 = ListNode(2, n3)
let n1 = ListNode(1, n2)

//let sol = Solution().revereseList(for: n1)
let sol = Solution().removeNthFromEnd(n1, 1)

print(sol)
