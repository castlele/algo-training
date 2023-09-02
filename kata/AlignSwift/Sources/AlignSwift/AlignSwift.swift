import Foundation

public func align(_ text: String, by separator: Character) -> String {
    var lines = text.split(separator: "\n").map { String($0) }

    guard lines.count > 1 else { return text }

    let (max, separatorIndices) = getSeparatorIndices(in: lines, separator: separator)

    for (lineIndex, sepIndex) in separatorIndices.enumerated() {
        guard let sepIndex else { continue }

        let difference = max - sepIndex
        let addingSpaces = String(repeating: " ", count: difference)
        let line = lines[lineIndex]
        let sepStringIndex = line.index(line.startIndex, offsetBy: sepIndex)
        let beforeSep = line.startIndex ..< sepStringIndex
        let afterSep = sepStringIndex ..< line.endIndex

        lines[lineIndex] = String(line[beforeSep]) + addingSpaces + String(line[afterSep])
    }

    return lines.joined(separator: "\n")
}

private func getSeparatorIndices(in lines: [String], separator: Character) -> (max: Int, all: [Int?]) {
    var max = Int.min

    let allIndices: [Int?] = lines.map { line in
        for (index, char) in line.enumerated() {
            if char == separator {
                if max < index {
                    max = index
                }

                return index
            }
        }

        return nil
    }

    return (max, allIndices)
}
