package twosum

import kotlin.test.Test
import kotlin.test.assertTrue
import kotlin.test.assertEquals

class LibraryTest {

    @Test
    fun `With input (1,2,3) and 4 answer is (0,2)`() {
        val numbers = listOf(1, 2, 3)
        val sum = 4

        val answer = TwoSum.twoSum(numbers.toIntArray(), sum)

        assertEquals(answer, 0 to 2)
    }
}
