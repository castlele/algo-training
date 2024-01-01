package maximummultiple

import kotlin.test.Test
import kotlin.test.assertEquals

class MaximumMultipleTest {

    @Test
    fun `Multiple of 2 with bound 7 is 6`() {
        val divisor = 2
        val bound = 7
        val expectedMultiple = 6

        val multiple = maxMultiple(divisor, bound)

        assertEquals(expectedMultiple, multiple)
    }

    @Test
    fun `Multiple of 3 with bound 10 is 9`() {
        val divisor = 3
        val bound = 10
        val expectedMultiple = 9

        val multiple = maxMultiple(divisor, bound)

        assertEquals(expectedMultiple, multiple)
    }

    @Test
    fun `Multiple of 7 with bound 17 is 14`() {
        val divisor = 7
        val bound = 17
        val expectedMultiple = 14

        val multiple = maxMultiple(divisor, bound)

        assertEquals(expectedMultiple, multiple)
    }

    @Test
    fun `Multiple of 10 with bound 50 is 50`() {
        val divisor = 10
        val bound = 50
        val expectedMultiple = 50

        val multiple = maxMultiple(divisor, bound)

        assertEquals(expectedMultiple, multiple)
    }

    @Test
    fun `Multiple of 37 with bound 200 is 185`() {
        val divisor = 37
        val bound = 200
        val expectedMultiple = 185

        val multiple = maxMultiple(divisor, bound)

        assertEquals(expectedMultiple, multiple)
    }

    @Test
    fun `Multiple of 7 with bound 100 is 98`() {
        val divisor = 7
        val bound = 100
        val expectedMultiple = 98

        val multiple = maxMultiple(divisor, bound)

        assertEquals(expectedMultiple, multiple)
    }
}
