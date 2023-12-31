package leapyear

const val lowerBoundYear = 1600
const val upperBoundYear = 4000

fun isLeapYear(years: Int): Boolean {
    if (years < lowerBoundYear || years > upperBoundYear) {
        return false
    }

    return when {
        years.isDividedBy(400) -> true
        years.isDividedBy(100) -> false
        else -> years.isDividedBy(4)
    }
}

private fun Int.isDividedBy(other: Int): Boolean {
    return this % other == 0
}
