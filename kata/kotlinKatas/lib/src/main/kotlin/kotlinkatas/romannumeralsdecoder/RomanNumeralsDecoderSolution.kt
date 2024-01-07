package romannumeralsdecoder

fun decode(str: String): Int {
    var decodedNum = 0
    var currentIndex = 0

    while (currentIndex < str.count()) {
        decodingMap.get(str.get(currentIndex).toString())
            ?.let {
                val nextNum = decodingMap.getOrDefault(str.getOrNull(currentIndex + 1).toString(), -1)

                if (nextNum > it) {
                    currentIndex += 2
                    decodedNum += nextNum - it
                } else {
                    currentIndex++
                    decodedNum += it
                }
            }
    }

    return decodedNum
}

private val decodingMap = mapOf(
    "I" to 1,
    "V" to 5,
    "X" to 10,
    "L" to 50,
    "C" to 100,
    "D" to 500,
    "M" to 1000
)
