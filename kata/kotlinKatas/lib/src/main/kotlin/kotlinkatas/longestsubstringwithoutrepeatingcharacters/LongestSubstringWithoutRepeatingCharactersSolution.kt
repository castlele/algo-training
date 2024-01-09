package longestsubstringwithoutrepeatingcharacters

class Solution {
    fun lengthOfLongestSubstring(s: String): Int {
        var length = 0

        val indexMap = mutableMapOf<Char, Int>()
        var right = 0
        var left = 0

        while (right < s.count()) {
            val currentChar = s.get(right)

            indexMap
                .get(currentChar)
                ?.let {
                    left = Math.max(it + 1, left)
                }

                indexMap.put(currentChar, right)
                length = Math.max(right - left + 1, length)
                right++
        }

        return length
    }
}
