package addtwonumbers

class ListNode(var `val`: Int) {
    var next: ListNode? = null

    override fun toString(): String {
        return "$`val` -> $next"
    }

    override fun equals(other: Any?): Boolean {
        if (other === this) return true
        if (other !is ListNode) return false

        return `val` == other.`val` && next == other.next
    }
}

class Solution {
    fun addTwoNumbers(l1: ListNode?, l2: ListNode?): ListNode? {
        return addTwoNumbersWithRecursion(l1, l2, 0)
    }

    private fun addTwoNumbersWithRecursion(l1: ListNode?, l2: ListNode?, ten: Int): ListNode? {
        if (l1 == null && l2 == null && ten == 0) return null

        val sum = l1.wrappedValue() + l2.wrappedValue() + ten

        return ListNode(sum % 10)
            .apply {
                next = addTwoNumbersWithRecursion(l1?.next, l2?.next, sum / 10)
            }
    }

    private fun ListNode?.wrappedValue() = this?.`val` ?: 0

    private fun addTwoNumbersWithoutRecursion(l1: ListNode?, l2: ListNode?): ListNode? {
        var lhs = l1
        var rhs = l2
        var ten = 0
        var sum: ListNode? = null
        var current: ListNode? = null

        while (lhs != null || rhs != null) {
            val currentSum = (lhs?.`val` ?: 0) + (rhs?.`val` ?: 0) + ten
            val node = ListNode(currentSum % 10)

            if (sum == null) {
                sum = node
                current = sum
            } else {
                current?.next = node
                current = current?.next
            }

            lhs = lhs?.next
            rhs = rhs?.next
            ten = ((currentSum - node.`val`) / 10).toInt()
        }

        if (ten > 0) current?.next = ListNode(ten)

        return sum
    }
}

