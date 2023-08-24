import XCTest
@testable import SplitStringSwift

final class SplitStringSwiftTests: XCTestCase {
    func testSplitEmptyStringGivesEmptyString() throws {
        let sep = " "
        let sui = ""

        let result = Splitter.split(sui, with: sep)

        XCTAssertEqual(result, [sui])
    }

    func testSplitStringWithNonOccuredSeparatorGivesTheSameString() throws {
        let sep = " "
        let sui = "Hello"

        let result = Splitter.split(sui, with: sep)

        XCTAssertEqual(result, [sui])
    }

    func testSplitStringWithOnceOccuredCharacterGivesTwoWords() throws {
        let sep = "e"
        let sui = "Hello"

        let result = Splitter.split(sui, with: sep)

        XCTAssertEqual(result, ["H", "llo"])
    }

    func testSplitStringWithMultipleOccuredCharacterGiveMultipleWords() throws {
        let sep = " "
        let sui = "hello hello hello"

        let result = Splitter.split(sui, with: sep)

        XCTAssertEqual(result, ["hello", "hello", "hello"])
    }
}
