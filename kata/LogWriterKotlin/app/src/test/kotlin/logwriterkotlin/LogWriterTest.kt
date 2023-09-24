package logwriterkotlin

import kotlin.math.sqrt
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertTrue

final class LogWriterTest {

    @Test
    fun wrappingToLoggingGivesResultWithLogsModel() {
        val number = 5
        val multipliedNumber = 5 * 2
        val wrappedNumber: ResultWithLogs<Int> = LogWriter.wrap(number)
        val method = ::multiplyByTwo

        val numberWithLogs = LogWriter.run(wrappedNumber, method)

        assertEquals(multipliedNumber, numberWithLogs.result)
        assertTrue(arrayOf("Number $number multiplied by 2 is $multipliedNumber").contentEquals(numberWithLogs.logs))
    }

    @Test
    fun wrappingToLoggingTwoTimeGivesValidResultAndTwoLogs() {
        val radius = 5.0
        val squaredNumber = radius * radius
        val area = Math.PI * squaredNumber
        val wrappedRadius = LogWriter.wrap(radius)
        val squareNumber = ::squareNumber
        val getCircleArea = ::getCircleArea

        val areaWithLogs = LogWriter.run(LogWriter.run(wrappedRadius, squareNumber), getCircleArea)

        assertEquals(area, areaWithLogs.result)
        assertTrue(
            arrayOf(
                "Number $radius squared is $squaredNumber",
                "Area of circle with radius $radius equals to $area"
            )
            .contentEquals(areaWithLogs.logs)
        )
    }

    // MARK: - Private methods

    private fun multiplyByTwo(number: Int): ResultWithLogs<Int> {
        val multipliedNumber = number * 2

        return ResultWithLogs<Int>(multipliedNumber, arrayOf("Number $number multiplied by 2 is $multipliedNumber"))
    }

    private fun getCircleArea(radiusSquared: Double): ResultWithLogs<Double> {
        val area = Math.PI * radiusSquared
        val radius = sqrt(radiusSquared)

        return ResultWithLogs<Double>(area, arrayOf("Area of circle with radius $radius equals to $area"))
    }

    private fun squareNumber(number: Double): ResultWithLogs<Double> {
        val squaredNumber = number * number

        return ResultWithLogs<Double>(squaredNumber, arrayOf("Number $number squared is $squaredNumber"))
    }
}