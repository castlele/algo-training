package addtwonumbers

import kotlin.test.Test
import kotlin.test.assertEquals

class AddTwoNumbersTest {

    @Test
    fun `Sum of (2, 4, 3) and (5, 6, 4) equals to (7, 0, 8)`() {
        val l1 = createLinkedListOf(2, 4, 3)
        val l2 = createLinkedListOf(5, 6, 4)
        val expectedResult = createLinkedListOf(7, 0, 8)

        val sum = Solution().addTwoNumbers(l1, l2)

        assertEquals(expectedResult, sum)
    }

    @Test
    fun `Sum of (0) and (0) equals to (0)`() {
        val l1 = createLinkedListOf(0)
        val l2 = createLinkedListOf(0)
        val expectedResult = createLinkedListOf(0)

        val sum = Solution().addTwoNumbers(l1, l2)

        assertEquals(expectedResult, sum)
    }

    @Test
    fun `Sum of (9, 9, 9, 9, 9, 9, 9) and (9, 9, 9, 9) equals to (8, 9, 9, 9, 0, 0, 0, 1)`() {
        val l1 = createLinkedListOf(9, 9, 9, 9, 9, 9, 9)
        val l2 = createLinkedListOf(9, 9, 9, 9)
        val expectedResult = createLinkedListOf(8, 9, 9, 9, 0, 0, 0, 1)

        val sum = Solution().addTwoNumbers(l1, l2)

        assertEquals(expectedResult, sum)
    }

    private fun createLinkedListOf(vararg values: Int): ListNode {
        var linkedList: ListNode? = null
        var current: ListNode? = null

        for (value in values) {
            val node = ListNode(value)

            if (linkedList == null) {
                linkedList = node
                continue
            }

            if (current == null) {
                current = node
                linkedList.next = current
            } else {
                current.next = node
                current = current.next
            }
        }

        return linkedList!!
    }
}
