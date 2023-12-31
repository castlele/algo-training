package vowelcount

import kotlin.test.Test
import kotlin.test.assertEquals

class VowelCountTest {

    @Test
    fun `Vowels count is 5`() {
        assertEquals(5, getCount("abracadabra"))
    }

    @Test
    fun `Vowels count is 1`() {
        assertEquals(1, getCount("test"))
    }

    @Test
    fun `Vowels count is 3`() {
        assertEquals(3, getCount("example"))
    }
}
