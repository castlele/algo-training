package primefactorkotlin

import kotlin.test.Test
import kotlin.test.assertContentEquals
import kotlin.test.assertTrue

class PrimeFactorTest {

    @Test
    fun `Prime factor of ONE do not exist`() {
        val sui = 1

        val primeFactors = PrimeFactor.calculate(sui)

        assertTrue(primeFactors.isEmpty())
    }

    @Test
    fun `Prime factor of TWO is two`() {
        val sui = 2

        val primeFactors = PrimeFactor.calculate(sui)

        assertContentEquals(listOf(2), primeFactors)
    }

    @Test
    fun `Prime factor of THREE is three`() {
        val sui = 3

        val primeFactors = PrimeFactor.calculate(sui)

        assertContentEquals(listOf(3), primeFactors)
    }

    @Test
    fun `Prime factor of FOURTH is {two, two}`() {
        val sui = 4

        val primeFactors = PrimeFactor.calculate(sui)

        assertContentEquals(listOf(2, 2), primeFactors)
    }

    @Test
    fun `Prime factor of SIX is {two, three}`() {
        val sui = 6

        val primeFactors = PrimeFactor.calculate(sui)

        assertContentEquals(listOf(2, 3), primeFactors)
    }

    @Test
    fun `Prime factor of EIGHT is {two, two, two}`() {
        val sui = 8

        val primeFactors = PrimeFactor.calculate(sui)

        assertContentEquals(listOf(2, 2, 2), primeFactors)
    }

    @Test
    fun `Prime factor of NINE is {three, three}`() {
        val sui = 9

        val primeFactors = PrimeFactor.calculate(sui)

        assertContentEquals(listOf(3, 3), primeFactors)
    }
}
