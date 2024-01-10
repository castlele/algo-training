package longestsubstringwithoutrepeatingcharacters

class Solution {
    fun lengthOfLongestSubstring(s: String): Int {
        val indexMap = mutableMapOf<Char, Int>()

        var len = 0
        var left = 0
        var right = 0

        while (right < s.count()) {
            s.getOrNull(right)
                ?.let { currentChar ->
                    indexMap.getOrElse(currentChar) { null }
                        ?.let {
                            left = Math.max(it + 1, left)
                        }

                    indexMap.put(currentChar, right)
                }

            len = Math.max(right - left + 1, len)
            right++
        }

        return len
    }
}
