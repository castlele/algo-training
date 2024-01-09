package canyougettheloop

import kotlin.test.Test
import kotlin.test.assertEquals

class CanYouGetTheLoopTest {

    @Test
    fun `Loop size of 12 without tail`() {
        val expectedLoopSize = 12
        val linkedList = createLoop(12)

        val loopSize = loopSize(linkedList)

        assertEquals(expectedLoopSize, loopSize)
    }

    @Test
    fun `Loop size of 10 with tail`() {
        val expectedLoopSize = 10
        val (tailStart, tailEnd) = createTail(4)
        val linkedList = createLoop(10)
        tailEnd.next = linkedList

        val loopSize = loopSize(tailStart)

        assertEquals(expectedLoopSize, loopSize)
    }

    @Test
    fun `Loop size of 1 without tail`() {
        val expectedLoopSize = 1
        val linkedList = createLoop(1)

        val loopSize = loopSize(linkedList)

        assertEquals(expectedLoopSize, loopSize)
    }

    private fun createLoop(size: Int): Node {
        val (start, end) = createTail(size)

        end.next = start

        return start
    }

    private fun createTail(size: Int): Pair<Node, Node> {
        val linkedList = Node(0)
        var current: Node? = linkedList

        for (index in 1..<size) {
            current?.next = Node(index)
            current = current?.next
        }

        return linkedList to current!!
    }
}
