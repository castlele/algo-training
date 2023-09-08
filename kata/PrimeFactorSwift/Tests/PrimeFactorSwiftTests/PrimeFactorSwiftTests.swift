import XCTest
@testable import PrimeFactorSwift

final class PrimeFactorSwiftTests: XCTestCase {
    func testGeneratePrimeFactorFromOne() throws {
        let sui = 1

        let result = getPrimeFactor(from: sui)

        XCTAssertEqual(result, [])
    }

    func testGeneratePrimeFactorFromTwo() throws {
        let sui = 2

        let result = getPrimeFactor(from: sui)

        XCTAssertEqual(result, [2])
    }

    func testGeneratePrimeFactorFromThree() throws {
        let sui = 3

        let result = getPrimeFactor(from: sui)

        XCTAssertEqual(result, [3])
    }

    func testGeneratePrimeFactorFromFour() throws {
        let sui = 4

        let result = getPrimeFactor(from: sui)

        XCTAssertEqual(result, [2, 2])
    }

    func testGeneratePrimeFactorFromSix() throws {
        let sui = 6

        let result = getPrimeFactor(from: sui)

        XCTAssertEqual(result, [2, 3])
    }

    func testGeneratePrimeFactorFromEight() throws {
        let sui = 8

        let result = getPrimeFactor(from: sui)

        XCTAssertEqual(result, [2, 2, 2])
    }

    func testGeneratePrimeFactorFromNine() throws {
        let sui = 9

        let result = getPrimeFactor(from: sui)

        XCTAssertEqual(result, [3, 3])
    }
}
