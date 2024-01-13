package primesinnumbers

object PrimeDecomp {
    fun factors(number: Int): String {
        var mutableNum = number
        var currentDel = 2
        var result = ""

        while (mutableNum != 1) {
            var times = 0

            while (mutableNum % currentDel == 0) {
                mutableNum /= currentDel
                times++
            }

            if (times > 0)
                result += "($currentDel${if (times > 1) "**$times" else ""})"

            currentDel++
        }

        return result
    }
}
