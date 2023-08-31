import XCTest
@testable import AuthorCommentSwift

final class AuthorCommentSwiftTests: XCTestCase {

    func testCommentEmptyLineAddsOnlyAuthorComment() throws {
        let author = getAuthorName()
        let commentSign = getCommentSign()
        let originalMessage = ""

        let result = addAuthorComment(to: originalMessage, with: commentSign, by: author)

        XCTAssertEqual(result, "// Author: \(author)")
    }

    func testCommentOneLineAddCommentToItAndAddsAuthorCommentAbove() throws {
        let author = getAuthorName()
        let commentSign = getCommentSign()
        let originalMessage = "[self.editor.shapeHandler setVerticalAlignment:alignment];"

        let result = addAuthorComment(to: originalMessage, with: commentSign, by: author)

        XCTAssertEqual(result, "// Author: \(author)\n// \(originalMessage)")
    }

    func testCommentNoneCommentedLineAddsAuthorCommentAboveWithoutModifingTheLine() throws {
        let author = getAuthorName()
        let commentSign = getCommentSign()
        let originalMessage = "// [self.editor.shapeHandler setVerticalAlignment:alignment];"

        let result = addAuthorComment(to: originalMessage, with: commentSign, by: author)

        XCTAssertEqual(result, "// Author: \(author)\n\(originalMessage)")
    }

    func testCommentOneIndentedLineAddsAuthorCommentWithTheSameIndentation() throws {
        let author = getAuthorName()
        let commentSign = getCommentSign()
        let indentation = "    "
        let originalMessage = "[self.editor.shapeHandler setVerticalAlignment:alignment];"

        let result = addAuthorComment(to: indentation + originalMessage, with: commentSign, by: author)

        XCTAssertEqual(result, "\(indentation)// Author: \(author)\n\(indentation)// \(originalMessage)")
    }

    func testCommentOneIndentedAndCommentedLineAddsAuthorCommentWithoutIndentation() throws {
        let author = getAuthorName()
        let commentSign = getCommentSign()
        let indentation = "    "
        let originalMessage = "// [self.editor.shapeHandler setVerticalAlignment:alignment];"

        let result = addAuthorComment(to: indentation + originalMessage, with: commentSign, by: author)

        XCTAssertEqual(result, "// Author: \(author)\n\(indentation)\(originalMessage)")
    }

    func testCommentTwoLinesAddsAuthorComment() throws {
        let author = getAuthorName()
        let commentSign = getCommentSign()
        let lineOne = "BOOL isAligned;"
        let lineTwo = "[self.editor.shapeHandler setVerticalAlignment:alignment];"
        let fullMessage = "\(lineOne)\n\(lineTwo)"

        let result = addAuthorComment(to: fullMessage, with: commentSign, by: author)

        XCTAssertEqual(result, "// Author: \(author)\n// \(lineOne)\n// \(lineTwo)")
    }

    func testCommentTwoCommentedLinesAddsAuthorCommentWithoutIndentation() throws {
        let author = getAuthorName()
        let commentSign = getCommentSign()
        let lineOne = "// BOOL isAligned;"
        let lineTwo = "    // [self.editor.shapeHandler setVerticalAlignment:alignment];"
        let fullMessage = "\(lineOne)\n\(lineTwo)"

        let result = addAuthorComment(to: fullMessage, with: commentSign, by: author)

        XCTAssertEqual(result, "// Author: \(author)\n\(lineOne)\n\(lineTwo)")
    }

    func testCommentThreeLinesWithDifferentIndentationCommentsOnMinimumIndentLevel() throws {
        let author = getAuthorName()
        let commentSign = getCommentSign()
        let indentation = "    "
        let lineOne = "if (!isAligned) {"
        let lineTwo = "[self.editor.shapeHandler setVerticalAlignment:alignment];"
        let lineThree = "}"
        let fullMessage = "\(indentation)\(lineOne)\n\(indentation)\(indentation)\(lineTwo)\n\(indentation)\(lineThree)"
        let expectedMessage = """
        \(indentation)\(commentSign) Author: \(author)
        \(indentation)\(commentSign) \(lineOne)
        \(indentation)\(commentSign) \(indentation)\(lineTwo)
        \(indentation)\(commentSign) \(lineThree)
        """

        let result = addAuthorComment(to: fullMessage, with: commentSign, by: author)

        XCTAssertEqual(result, expectedMessage)
    }

    func testCommentSingleLineWithUserParametersAddsAuthorAndParametersToTheLine() throws {
        let author = getAuthorName()
        let commentSign = getCommentSign()
        let parameters = getParameters()
        let line = "[self.editor.shapeHandler setVerticalAlignment:alignment];"
        let expectedMessage = "// Author: \(author)\n// TODO: Fix this\n// \(line)"

        let result = addAuthorComment(to: line, with: commentSign, by: author, adding: parameters)

        XCTAssertEqual(result, expectedMessage)
    }

    // MARK: - Helper methods

    private func getAuthorName() -> String {
        "castlelecs"
    }

    private func getCommentSign() -> String {
        "//"
    }

    private func getParameters() -> [Header] {
        [
            Header(name: "TODO", comment: "Fix this")
        ]
    }
}
