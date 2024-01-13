package primesinnumbers

import kotlin.test.Test
import kotlin.test.assertEquals

class PrimesInNumbersTest {

    @Test
    fun `Prime factor of 1`() {
        val number = 1
        val expectedOutput = ""

        val decomposition = PrimeDecomp.factors(number)

        assertEquals(expectedOutput, decomposition)
    }

    @Test
    fun `Prime factor of 2`() {
        val number = 2
        val expectedOutput = "(2)"

        val decomposition = PrimeDecomp.factors(number)

        assertEquals(expectedOutput, decomposition)
    }

    @Test
    fun `Prime factor of 3`() {
        val number = 3
        val expectedOutput = "(3)"

        val decomposition = PrimeDecomp.factors(number)

        assertEquals(expectedOutput, decomposition)
    }

    @Test
    fun `Prime factor of 4`() {
        val number = 4
        val expectedOutput = "(2**2)"

        val decomposition = PrimeDecomp.factors(number)

        assertEquals(expectedOutput, decomposition)
    }

    @Test
    fun `Prime factor of 5`() {
        val number = 5
        val expectedOutput = "(5)"

        val decomposition = PrimeDecomp.factors(number)

        assertEquals(expectedOutput, decomposition)
    }

    @Test
    fun `Prime factor of 6`() {
        val number = 6
        val expectedOutput = "(2)(3)"

        val decomposition = PrimeDecomp.factors(number)

        assertEquals(expectedOutput, decomposition)
    }

    @Test
    fun `Prime factor of 7`() {
        val number = 7
        val expectedOutput = "(7)"

        val decomposition = PrimeDecomp.factors(number)

        assertEquals(expectedOutput, decomposition)
    }

    @Test
    fun `Prime factor of 8`() {
        val number = 8
        val expectedOutput = "(2**3)"

        val decomposition = PrimeDecomp.factors(number)

        assertEquals(expectedOutput, decomposition)
    }

    @Test
    fun `Prime factor of 9`() {
        val number = 9
        val expectedOutput = "(3**2)"

        val decomposition = PrimeDecomp.factors(number)

        assertEquals(expectedOutput, decomposition)
    }

    @Test
    fun `Prime factor of 10`() {
        val number = 10
        val expectedOutput = "(2)(5)"

        val decomposition = PrimeDecomp.factors(number)

        assertEquals(expectedOutput, decomposition)
    }

    @Test
    fun `Prim factor of 7775560`() {
        val number = 7775460
        val expectedOutput = "(2**2)(3**3)(5)(7)(11**2)(17)"

        val decomposition = PrimeDecomp.factors(number)

        println(decomposition)

        assertEquals(expectedOutput, decomposition)
    }
}
