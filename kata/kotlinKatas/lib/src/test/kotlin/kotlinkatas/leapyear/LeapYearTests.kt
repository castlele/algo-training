package leapyear

import kotlin.test.Test
import kotlin.test.assertEquals

final class LeapYearTest {

    @Test
    fun `Year 2020 is Leap`() {
        assertEquals(true, isLeapYear(2020))
    }

    @Test
    fun `Year 2000 is Leap`() {
        assertEquals(true, isLeapYear(2000))
    }

    @Test
    fun `Year 2015 is not Leap`() {
        assertEquals(false, isLeapYear(2015))
    }

    @Test
    fun `Year 2100 is not Leap`() {
        assertEquals(false, isLeapYear(2100))
    }
}
