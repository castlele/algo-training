import XCTest
@testable import PipeSwift

final class PipeSwiftTests: XCTestCase {

    func testPassingNumberToAFunctionGivesNewNumber() throws {
        let number = 10
        let method = { num in num * 2 }

        let result = number |> method

        XCTAssertEqual(result, 20)
    }

    func testPassingNumberToAFunctionTwoTimesGivesDoubleChangedNumber() throws {
        let number = 10
        let method = { num in num * 2 }

        let result = number |> method |> method

        XCTAssertEqual(result, 40)
    }

    func testPassingSystemMethodChangesNumberAsExpected() throws {
        let number = 10.0
        let method: (Double) -> Double = sin

        let result = number |> method

        XCTAssertEqual(result, sin(number))
    }

    func testPassingTwoNumbersToFunctionWithTwoParametersChangesBoth() throws {
        let numbers = (10, 10)
        let method = { n1, n2 in (n1 * 2, n2 * 2) }

        let result = numbers |> method

        XCTAssertEqual(result.0, 20)
        XCTAssertEqual(result.1, 20)
    }

    func testChainFromTwoNumbersToOneNumberAsResult() throws {
        let numbers = (10, 10)
        let addition: (Int, Int) -> Double = { n1, n2 in Double(n1 + n2) }

        let result = numbers |> addition |> sin

        XCTAssertEqual(result, sin(Double(20)))
    }
}
