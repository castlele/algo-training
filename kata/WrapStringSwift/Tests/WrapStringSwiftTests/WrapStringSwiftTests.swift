import XCTest
@testable import WrapStringSwift

final class WrapStringSwiftTests: XCTestCase {

    func testWrapEmptyStringHasNoEffect() throws {
        let sui = ""
        let bounds = 0

        let wrappedString = wrap(sui, at: bounds)

        XCTAssertEqual(wrappedString, [""])
    }

    func testWrapOneWordWithHightBoundsHasNoEffect() throws {
        let sui = "hello"
        let bounds = 10

        let wrappedString = wrap(sui, at: bounds)

        XCTAssertEqual(wrappedString, ["hello"])
    }

    func testWrapOneWordWithBoundsAtTheCenterSplitsIntoTwoWords() throws {
        let sui = "hello"
        let bounds = 3

        let wrappedString = wrap(sui, at: bounds)

        XCTAssertEqual(wrappedString, ["hel", "lo"])
    }

    func testWrapOneWordWithSmallBoundsSplitsIntoMultipleWords() throws {
        let sui = "hellohellohello"
        let bounds = 5

        let wrappedString = wrap(sui, at: bounds)

        XCTAssertEqual(wrappedString, ["hello", "hello", "hello"])
    }

    func testWrapTwoWordsAtSpaceSplitsIntoTwoWords() throws {
        let sui = "hello hello"
        let bounds = 6

        let wrappedString = wrap(sui, at: bounds)

        XCTAssertEqual(wrappedString, ["hello", "hello"])
    }

    func testWrapTwoWordsAfterSpaceSplitsIntoTwoWords() throws {
        let sui = "hello hello"
        let bounds = 7

        let wrappedString = wrap(sui, at: bounds)

        XCTAssertEqual(wrappedString, ["hello", "hello"])
    }

    func testWrapTwoWordsBeforeSpaceSplitsIntoTwoWords() throws {
        let sui = "hello hello"
        let bounds = 5

        let wrappedString = wrap(sui, at: bounds)

        XCTAssertEqual(wrappedString, ["hello", "hello"])
    }
}
