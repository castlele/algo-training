import Foundation

final class DocsStorage {
    var docsChains = [Set<Int>]()

    func add(_ docs: [Int]) {
        var joints = 0
        var max: Int?

        for i in 0..<docsChains.count {
            if docsChains[i].contains(docs[0]) {
                joints += 1
            }

            if docsChains[i].contains(docs[1]) {
                joints += 1
            }

            if joints > (max ?? 0), joints != 0 {
                max = i
            }
            joints = 0
        }
        // print("MAX: \(max)")

        if let max = max {
            docsChains[max].insert(docs[0])
            docsChains[max].insert(docs[1])
            // print(docsChains)
            return
        }

        docsChains.append(Set(docs))
        // print(docsChains)
    }

    func answer(_ q: [(Int, [Int])]) {
        // var d = [Int: (Int, String)]
        remove()
        var num = 0
        var message = ""

        for (id, docs) in q {
            guard let chain = findChain(forId: id) else {
                continue
            }

            var _num = 0
            var _message = ""

            for doc in docs {
                if chain.contains(doc) {
                    _num += 1
                    _message += "\(doc) "
                }
            }

            print("\(num) " + message)

            // if num > _num {
            //     num = _num
            //     message = _message
            // }
        }

    }

    func remove() {
for i in 0..<docsChains.count {
    var j = i + 1
    while j < docsChains.count {
        if !docsChains[i].isDisjoint(with: docsChains[j]) {
            docsChains[i].formUnion(docsChains[j])
            docsChains.remove(at: j)
        } else {
            j += 1
        }
    }
}

    }

    func findChain(forId id: Int) -> Set<Int>? {
        for chain in docsChains {
            if chain.contains(id) {
                return chain
            }
        }

        return nil
    }
}

func getInput() {
    let storage = parseDocument()
    let questions = parseQuestions()
    // print("---")
    // print(storage.docsChains)
    // print("---")
    storage.answer(questions)
}

func parseDocument() -> DocsStorage {
    let number = Int(readLine()!)!
    let storage = DocsStorage()

    for _ in 0..<number {
        let docs = readLine()!.split(separator: " ").map { Int($0)! }
        storage.add(docs)
    }

    return storage
}

func parseQuestions() -> [(Int, [Int])] {
    let number = Int(readLine()!)!
    var questions = [(Int, [Int])]()

    for _ in 0..<number {
        let id = readLine()!.split(separator: " ").map { Int($0)! }[0]
        let docs = readLine()!.split(separator: " ").map { Int($0)! }

        questions.append((id, docs))
    }

    return questions
}

getInput()
