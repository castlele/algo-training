package twosum

object TwoSum {
    fun twoSum(numbers: IntArray, target: Int): Pair<Int,Int> {
        var lhsNum = 0
        var rhsNum = 0

        for (firstNumIndex in numbers.indices) {
            val firstNumValue = numbers[firstNumIndex]

            lhsNum = firstNumIndex

            for (secondNumIndex in numbers.indices + 1) {
                val secondNumValue = numbers[secondNumIndex]
                val sum = firstNumValue + secondNumValue

                if (sum == target && firstNumIndex != secondNumIndex) {
                    rhsNum = secondNumIndex

                    return@twoSum lhsNum to rhsNum
                }
            }
        }

        return lhsNum to rhsNum
    }
}
