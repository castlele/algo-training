package equalsidesofanarray

object EqualSidesOfAnArray {
    fun findEvenIndex(arr: IntArray): Int {
        var rhsSum = arr.sum()
        var lhsSum = 0
        var currentIndex = -1

        arr.forEachIndexed { index, element ->
            rhsSum -= element

            if (lhsSum == rhsSum)
                currentIndex = if (currentIndex == -1) index else Math.min(currentIndex, index)

            lhsSum += element
        }

        return currentIndex
    }
}
