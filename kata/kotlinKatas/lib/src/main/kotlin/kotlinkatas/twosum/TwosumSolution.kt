package twosum

class Solution {
    fun twoSum(nums: IntArray, target: Int): IntArray {
        val diffMap = mutableMapOf<Int, Int>()

        nums.forEachIndexed { index, num ->
            diffMap[num]?.let { return intArrayOf(it, index) }
            diffMap[target - num] = index
        }

        return intArrayOf()
    }
}
