import XCTest
@testable import AlignSwift

final class AlignSwiftTests: XCTestCase {
    func testAligningEmptyLineReturnsEmptyString() throws {
        let text = ""
        let sep: Character = "|"

        let alignedString = align(text, by: sep)

        XCTAssertEqual(alignedString, text)
    }


    func testAligningOneLineReturnsTheSameLine() throws {
        let text = "print(\"Hello, World\")"
        let sep: Character = ","

        let alignedString = align(text, by: sep)

        XCTAssertEqual(alignedString, text)
    }

    func testAligningEqualLinesReturnsTheSameLines() throws {
        let text = """
        SOME_STR: char
        SOME_STR: char
        """
        let sep: Character = "|"

        let alignedString = align(text, by: sep)

        XCTAssertEqual(alignedString, text)
    }

    func testAligningDifferentLinesByExistingSeparatorReturnsAlignedLines() throws {
        let text = """
        SOME_STR: char
        SOME_ARRAY: *char
        SOME_INT: int
        """
        let sep: Character = ":"

        let alignedString = align(text, by: sep)

        XCTAssertEqual(alignedString, """
        SOME_STR  : char
        SOME_ARRAY: *char
        SOME_INT  : int
        """)
    }
}
