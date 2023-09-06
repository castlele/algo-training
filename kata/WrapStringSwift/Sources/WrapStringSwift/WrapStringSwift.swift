public func wrap(_ string: String, at bounds: Int) -> [String] {
    guard bounds < string.count else {
        return [string]
    }

    let (firstHalfRange, secondHalfRange) = getWrappingPosition(of: string, bounds: bounds)
    let (firstHalf, secondHalf) = wrap(string: string, firstHalfRange: firstHalfRange, secondHalfRange: secondHalfRange)

    return [firstHalf] + wrap(secondHalf, at: bounds)
}

// MARK - Private functions

private typealias WrappingPosition = (firstHalfRange: Range<String.Index>, secondHalfRange: Range<String.Index>)

private func getWrappingPosition(of string: String, bounds: Int) -> WrappingPosition {
    let startIndex = string.startIndex
    let endIndex = string.endIndex
    let boundsIndex = bounds - 1
    let boundsPosition = string.index(string.startIndex, offsetBy: boundsIndex)

    if string[boundsPosition] == " " {
        return (startIndex..<boundsPosition, string.index(after: boundsPosition)..<endIndex)

    } else if string[string.index(before: boundsPosition)] == " " {
        let spacePosition = string.index(before: boundsPosition)

        return (startIndex..<spacePosition, string.index(after: spacePosition)..<endIndex)

    } else if string[string.index(after: boundsPosition)] == " " {
        let spacePosition = string.index(after: boundsPosition)

        return (startIndex..<spacePosition, string.index(after: spacePosition)..<endIndex)
    }

    return (startIndex..<string.index(after: boundsPosition), string.index(after: boundsPosition)..<endIndex)
}

private func wrap(string: String,
                  firstHalfRange: Range<String.Index>,
                  secondHalfRange: Range<String.Index>) -> (firstHalf: String, secondHalf: String) {

    let firstHalf = String(string[firstHalfRange])
    let secondHalf = String(string[secondHalfRange])

    return (firstHalf, secondHalf)
}
