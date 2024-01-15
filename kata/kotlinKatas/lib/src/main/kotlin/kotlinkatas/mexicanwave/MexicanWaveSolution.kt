package mexicanwave

fun wave(str: String): List<String> {
    val result = mutableListOf<String>()

    for (index in str.indices) {
        val char = str[index].toString()

        if (char.isBlank()) continue

        result.add(
            "${str.substring(0, index)}${char.uppercase()}${str.substring(index + 1)}"
        )
    }

    println(result)

    return result
}
