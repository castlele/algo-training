package wrapstringkotlin

import kotlin.test.Test
import kotlin.test.assertTrue

class WrapStringTest {
    @Test
    fun wrappingEmptyStringGivesArrayWithEmptyString() {
        val string = ""
        val bounds = 10

        val wrappedLines = Wrapper.wrap(string, bounds)

        assertTrue(linesEquals(arrayOf(""), wrappedLines))
    }

    @Test
    fun wrappingEmptyStringWithZeroBoundsGivesArrayWithEmptyString() {
        val string = ""
        val bounds = 0

        val wrappedLines = Wrapper.wrap(string, bounds)

        assertTrue(linesEquals(arrayOf(""), wrappedLines))
    }

    @Test
    fun wrappingOneWordWithBigBoundGivesArrayWithTheGivenWord() {
        val string = "hello"
        val bounds = 100

        val wrappedLines = Wrapper.wrap(string, bounds)

        assertTrue(linesEquals(arrayOf(string), wrappedLines))
    }

    @Test
    fun wrappingWordWithBoundOfHalfWordLengthWrapsItIntoTwoParts() {
        val string = "hellohello"
        val bounds = string.length / 2

        val wrappedLines = Wrapper.wrap(string, bounds)

        assertTrue(linesEquals(arrayOf("hello", "hello"), wrappedLines))
    }

    @Test
    fun wrapOneWordMultipleTimes() {
        val string = "hellohellohello"
        val bounds = 5

        val wrappedLines = Wrapper.wrap(string, bounds)

        assertTrue(linesEquals(arrayOf("hello", "hello", "hello"), wrappedLines))
    }

    @Test
    fun wrapTwoWordsAtSpace() {
        val string = "hello world"
        val bounds = 6

        val wrappedLines = Wrapper.wrap(string, bounds)

        assertTrue(linesEquals(arrayOf("hello", "world"), wrappedLines))
    }

    @Test
    fun wrapTwoWordsAfterSpace() {
        val string = "hello world"
        val bounds = 7

        val wrappedLines = Wrapper.wrap(string, bounds)

        assertTrue(linesEquals(arrayOf("hello", "world"), wrappedLines))
    }

    @Test
    fun wrapTwoWordsBeforeSpace() {
        val string = "hello world"
        val bounds = 5

        val wrappedLines = Wrapper.wrap(string, bounds)

        assertTrue(linesEquals(arrayOf("hello", "world"), wrappedLines))
    }

    private fun linesEquals(a1: Array<String>, a2: Array<String>): Boolean {
        val isEqual = a1.contentEquals(a2)

        if (!isEqual) {
            println("Lines don't equal to each other, expected: ${a1.asString()}, but got: ${a2.asString()}")
        }

        return isEqual
    }

    private fun Array<String>.asString(): String {
        var result = "["

        this.forEachIndexed { index, element ->
            result += "\"$element\""

            if (index != this.count() - 1) {
                result += ", "
            }
        }

        result += "]"

        return result
    }
}
