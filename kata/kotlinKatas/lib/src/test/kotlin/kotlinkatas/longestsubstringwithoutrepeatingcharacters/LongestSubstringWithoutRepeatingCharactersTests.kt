package longestsubstringwithoutrepeatingcharacters

import kotlin.test.Test
import kotlin.test.assertEquals

class LongestSubstringWithoutRepeatingCharactersTest {

    private val sut = Solution()

    @Test
    fun `Logest substring in abcabcbb is abc with length of 3`() {
        val string = "abcabcbb"
        val expectedLength = 3

        val length = sut.lengthOfLongestSubstring(string)

        assertEquals(expectedLength, length)
    }

    @Test
    fun `Logest substring in bbbbb is b with length of 1`() {
        val string = "bbbbb"
        val expectedLength = 1

        val length = sut.lengthOfLongestSubstring(string)

        assertEquals(expectedLength, length)
    }

    @Test
    fun `Logest substring in pwwkew is wke with length of 3`() {
        val string = "pwwkew"
        val expectedLength = 3

        val length = sut.lengthOfLongestSubstring(string)

        assertEquals(expectedLength, length)
    }

    @Test
    fun `Logest substring in ' ' is ' ' with length of 1`() {
        val string = " "
        val expectedLength = 1

        val length = sut.lengthOfLongestSubstring(string)

        assertEquals(expectedLength, length)
    }
}
