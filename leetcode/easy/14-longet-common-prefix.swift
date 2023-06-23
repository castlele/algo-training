import Foundation

final class Node {
    var value: Character?
    weak var parent: Node?
    var children: [Character: Node] = [:]

    init(value: Character? = nil, parent: Node? = nil) {
        self.value = value
        self.parent = parent
    }

    func add(child: Character) {
        guard children[child] == nil else {
            return
        }

        children[child] = Node(value: child, parent: self)
    }
}

final class Trie {
    private var root = Node()

    func insertAndReturnCommonPrefix(string: String) -> String {
        guard !string.isEmpty else {
            return ""
        }

        var currentNode = root
        var prefix = currentNode.children.isEmpty ? string : ""
        let characters = Array(string.lowercased())
        var currentIndex = Int.zero

        while currentIndex < string.count {
            let character = characters[currentIndex]

            if let child = currentNode.children[character] {
                prefix += String(child.value!)
                currentNode = child
            } else {
                currentNode.add(child: character)
                currentNode = currentNode.children[character]!
            }

            currentIndex += 1
        }

        return prefix
    }
}

class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var trie = Trie()
        var prefix = ""

        for index in 0..<strs.count {
            let currentPrefix = trie.insertAndReturnCommonPrefix(string: strs[index])
            print(currentPrefix)

            if currentPrefix.count < prefix.count || index == 0 {
                prefix = currentPrefix
            }

            if prefix.isEmpty {
                return ""
            }
        }

        return strs.count == 1 ? strs[0] : prefix
    }
}
