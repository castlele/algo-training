public enum CalculatorError: String, Error {
    case negativesNotAllowed = "Negatives not allowed"
}

public func calculate(_ string: String, delimiter: Character = ",") throws -> Int {
    try string
        .split(separator: delimiter)
        .map {
            let number = Int($0) ?? 0

            guard number >= 0 else {
                throw CalculatorError.negativesNotAllowed
            }

            return number
        }
        .reduce(0, +)
}
