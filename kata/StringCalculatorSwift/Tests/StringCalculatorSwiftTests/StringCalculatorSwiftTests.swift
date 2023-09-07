import XCTest
@testable import StringCalculatorSwift

final class StringCalculatorSwiftTests: XCTestCase {

    func testEmptyStringIsZero() throws {
        let sui = ""

        let result = try calculate(sui)

        XCTAssertEqual(result, 0)
    }

    func testSingleNumberGivesThisNumber() throws {
        let sui = "1"

        let result = try calculate(sui)

        XCTAssertEqual(result, 1)
    }

    func testTwoNumbersDelimitedByCommaGivesSum() throws {
        let sui = "10,20"

        let result = try calculate(sui)

        XCTAssertEqual(result, 30)
    }

    func testTwoNumbersDelimitedByNewLineGivesSum() throws {
        let sui = "10\n20"

        let result = try calculate(sui, delimiter: "\n")

        XCTAssertEqual(result, 30)
    }

    func testIfStringContainsNegativeNumberFunctionThrows() throws {
        let sui = "-1,2,-3"

        XCTAssertThrowsError(try calculate(sui))
    }
}
