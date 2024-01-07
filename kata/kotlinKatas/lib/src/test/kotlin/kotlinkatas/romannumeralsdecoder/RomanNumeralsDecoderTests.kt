package romannumeralsdecoder

import kotlin.test.Test
import kotlin.test.assertEquals

class RomanNumeralsDecoderTest {

    @Test
    fun `Decoding empty string`() {
        val decodedNum = decode("")

        assertEquals(0, decodedNum)
    }

    @Test
    fun `Decoding I string`() {
        val decodedNum = decode("I")

        assertEquals(1, decodedNum)
    }

    @Test
    fun `Decoding XXI string`() {
        assertEquals(21, decode("XXI"))
    }

    @Test
    fun `Decoding MMVIII string`() {
        assertEquals(2008, decode("MMVIII"))
    }

    @Test
    fun `Decoding MDCLXVI string`() {
        assertEquals(1666, decode("MDCLXVI"))
    }
}
