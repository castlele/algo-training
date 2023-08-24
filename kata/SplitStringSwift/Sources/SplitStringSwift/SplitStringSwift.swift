public final class Splitter {
    public static func split(_ string: String, with separator: String) -> [String] {
        var result = [String]()
        var currentString = ""

        for character in string {
            if String(character) == separator {
                if !currentString.isEmpty {
                    result.append(currentString)
                }

                currentString = ""
            } else {
                currentString += String(character)
            }
        }

        result.append(currentString)

        return result
    }
}
