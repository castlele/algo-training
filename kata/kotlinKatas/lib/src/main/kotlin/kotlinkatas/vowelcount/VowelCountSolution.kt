package vowelcount

fun getCount(str: String): Int {
    return str.count(Char::isVowel)
}

private fun Char.isVowel(): Boolean = when(this) {
    'a', 'e', 'i', 'o', 'u' -> true
    else -> false
}
