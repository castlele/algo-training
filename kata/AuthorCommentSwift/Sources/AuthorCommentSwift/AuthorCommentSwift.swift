import Foundation

public struct Header {

    public var name: String
    public var comment: String

    public init(name: String, comment: String) {
        self.name = name
        self.comment = comment
    }
}

public func addAuthorComment(to message: String,
                             with commentSign: String,
                             by author: String,
                             adding parameters: [Header] = []) -> String {

    var lines = message.split(separator: "\n").map { String($0) }
    let (minIndent, allIndets) = getIndentInfo(for: lines, with: commentSign)
    let minStringIndent = createIndent(from: minIndent)
    let authorLine = "\(minStringIndent)\(commentSign) Author: \(author)"
    let parametersLines = createHeader(with: parameters, commentSign: commentSign, indent: minStringIndent)
    var header = authorLine

    if !parametersLines.isEmpty {
        header += "\n" + parametersLines
    }

    for (index, line) in lines.enumerated() {
        guard let lineIndentLevel = allIndets[index] else {
            continue
        }

        let differenceIndentLevel = lineIndentLevel - minIndent
        let differenceIndent = createIndent(from: differenceIndentLevel)

        lines[index] = "\(minStringIndent)\(commentSign) \(differenceIndent)\(triml(line))"
    }

    if message.isEmpty {
        return header
    }

    return header + "\n" + lines.joined(separator: "\n")
}

// MARK: - Private methods

private func createHeader(with params: [Header], commentSign: String, indent: String) -> String {
    params
        .map { "\(indent)\(commentSign) \($0.name): \($0.comment)" }
        .joined(separator: "\n")
}

private func getIndentInfo(for lines: [String], with prefix: String) -> (min: Int, all: [Int?]) {
    guard !lines.isEmpty else {
        return (0, [])
    }

    var min = Int.max
    let all: [Int?] = lines.map { line in
        let trimmedLine = triml(line)

        guard !trimmedLine.starts(with: prefix) else {
            return nil
        }

        let indent = getIndentation(from: line)

        if min > indent {
            min = indent
        }

        return indent
    }

    if min == Int.max {
        min = 0
    }

    return (min, all)
}

private func getIndentation(from line: String) -> Int {
    var indent = 0

    for char in line {
        if char != " " {
            break
        }

        indent += 1
    }

    return indent
}

private func triml(_ str: String) -> String {
     String(str.drop { char in char == " " })
}

private func createIndent(from level: Int) -> String {
    String(repeating: " ", count: level)
}
