package spinwords

fun spinWords(sentence: String): String {
    return sentence
        .split(" ")
        .map { word ->
            if (word.count() >= 5) {
                word.reversed()
            } else {
                word
            }
        }
        .joinToString(" ")
}
