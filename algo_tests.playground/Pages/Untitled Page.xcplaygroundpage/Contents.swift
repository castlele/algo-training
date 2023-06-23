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
    func swapPairs(_ head: ListNode?) -> ListNode? {
        var h: ListNode?
        var p: ListNode?
        var next = head?.next
        var cur = head
        var prev: ListNode?

        while cur != nil {
            let buf = next?.next

            prev?.next = next
            next?.next = cur
            cur?.next = buf

            if h == nil {
                h = next
                p = h
            } else {
                h?.next = next
            }

            h = h?.next

            prev = next?.next
            cur = prev?.next
            next = prev?.next
        }

        print(head)
        print(h)
        return p
    }
}

let _4 = ListNode(4)
let _3 = ListNode(3, _4)
let _2 = ListNode(2, _3)
let _1 = ListNode(1, _2)

print(Solution().swapPairs(_1))
