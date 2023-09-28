package pipekotlin

import kotlin.test.Test
import kotlin.test.assertEquals

class PipeTest {

    @Test
    fun pipeWithEmptyClosureDoesNotAffectFirstTimePassedValue() {
        val number = 10
        val closure: (Int) -> Int = { x -> x }

        val result = Pipe
            .start(number, closure)
            .evaluate()

        assertEquals(number, result)
    }

    @Test
    fun pipeWithEmptyClosureEvaluatedMultipleTimesDoesNotAffectFirstTimePassedValue() {
        val number = 10
        val closure: (Int) -> Int = { x -> x }

        val result = Pipe
            .start(number, closure)
            .pass(closure)
            .pass(closure)
            .evaluate()

        assertEquals(number, result)
    }

    @Test
    fun pipeChangesGivenValue() {
        val number = 10
        val closure: (Int) -> Int = { x -> x * 2 }

        val result = Pipe
            .start(number, closure)
            .pass(closure)
            .evaluate()

        assertEquals(40, result)
    }

    @Test
    fun pipeCanChangeIntermediateTimeOfTheGivenValue() {
        val number = 10
        val multiply: (Int) -> Int = { x -> x * 2 }
        val toString: (Int) -> String = { x -> x.toString() }
        val resultString: (String) -> String = { x -> "Result number is equal to: $x" }

        val result = Pipe
            .start(number, multiply)
            .pass(toString)
            .pass(resultString)
            .evaluate()

        assertEquals("Result number is equal to: 20", result)
    }
}