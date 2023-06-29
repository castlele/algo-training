func isValid(_ s: String) -> Bool {
    var stack = [Character]()

    for char in Array(s) {
        if char.isOpen {
            stack.append(char)
        } else {
            guard let tail = stack.popLast() else {
                return false
            }

            if tail.corresponding != char {
                return false
            }
        }
    }

    return stack.isEmpty
}

extension String.Element {
    var corresponding: Character {
        switch self {
        case "(":
            return ")"

        case ")":
            return "("

        case "[":
            return "]"

        case "]":
            return "["

        case "{":
            return "}"

        case "}":
            return "{"

        default:
            return "("
        }
    }

    var isOpen: Bool {
        "([{".contains(self)
    }
}

print(isValid("()"))
print(isValid("()[]{}"))
print(isValid("(]"))
