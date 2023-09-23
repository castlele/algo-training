import XCTest
@testable import LogWriterSwift

final class LogWriterSwiftTests: XCTestCase {

    func testMultiplyByTwoLogging() throws {
        let number: NumberWithLogs = wrapToLogs(5)
        let method = multiplyByTwo

        let numberWithLoggingInfo = runWithLogs(number, method)

        XCTAssertEqual(numberWithLoggingInfo.result, 10)
        XCTAssertEqual(numberWithLoggingInfo.logs, ["Number: \(number.result) is multipling by 2"])
    }

    func testNestedLoggingMethod() throws {
        let number: NumberWithLogs = wrapToLogs(5)
        let square = square
        let getArea = getCircleArea(withSquaredRadius:)

        let numberWithLoggingInfo = runWithLogs(runWithLogs(number, square), getArea)

        XCTAssertEqual(numberWithLoggingInfo.result, 75)
        XCTAssertEqual(numberWithLoggingInfo.logs, [
            "Number: \(5) is squared",
            "Get circle area with radius: \(5)"
        ])
    }

    // MARK - Helper methods

    private func multiplyByTwo(_ number: Int) -> NumberWithLogs {
        NumberWithLogs(number * 2, ["Number: \(number) is multipling by 2"])
    }

    private func square(_ number: Int) -> NumberWithLogs {
        NumberWithLogs(number * number, ["Number: \(number) is squared"])
    }

    private func getCircleArea(withSquaredRadius r: Int) -> NumberWithLogs {
        let radius = sqrt(Float(r))

        return NumberWithLogs(3 * r, ["Get circle area with radius: \(Int(radius))"])
    }
}
