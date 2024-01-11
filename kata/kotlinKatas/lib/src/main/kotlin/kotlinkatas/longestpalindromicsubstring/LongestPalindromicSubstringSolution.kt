package longestpalindromicsubstring

class Solution {
    fun longestPalindrome(s: String): String {
        val dp = MutableList(s.length) { i -> MutableList(s.length) { i >= it } }
        var longest = s.first().toString()

        for (to in s.indices)
            for (from in to - 1 downTo 0) {
                dp[from][to] = s[from] == s[to] && dp[from + 1][to - 1]

                if (dp[from][to] && from - to + 1 > longest.count()) {
                    longest = s.substring(from, to)
                }
            }

        return longest
    }
}
