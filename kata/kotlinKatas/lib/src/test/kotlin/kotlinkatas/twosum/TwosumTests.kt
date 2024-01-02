package twosum

import kotlin.test.Test
import kotlin.test.assertTrue

class TwoSumTest {

    @Test
    fun `Nums (2, 7, 11, 15) with target 9 have indicies (0, 1)`() {
        val nums = intArrayOf(2, 7, 11, 15)
        val target = 9
        val expectedResult = intArrayOf(0, 1)

        val sum = Solution().twoSum(nums, target)

        assertTrue(expectedResult.contentEquals(sum))
    }

    @Test
    fun `Nums (3, 2, 4) with target 6 have indicies (1, 2)`() {
        val nums = intArrayOf(3, 2, 4)
        val target = 6
        val expectedResult = intArrayOf(1, 2)

        val sum = Solution().twoSum(nums, target)

        assertTrue(expectedResult.contentEquals(sum))
    }

    @Test
    fun `Nums (3, 3) with target 6 have indicies (0, 1)`() {
        val nums = intArrayOf(3, 3)
        val target = 6
        val expectedResult = intArrayOf(0, 1)

        val sum = Solution().twoSum(nums, target)

        assertTrue(expectedResult.contentEquals(sum))
    }
}
