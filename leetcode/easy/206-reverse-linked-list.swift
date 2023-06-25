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
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard head != nil else {
            return nil
        }

        var curr = head
        var prev: ListNode? = nil
        var next: ListNode? = nil

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

let solution = Solution()

print(solution.reverseList(n1))
