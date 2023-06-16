import Foundation

struct PriorityQueue {
    private var elements: [Int] = []
    private let isHigherPriority: (Int, Int) -> Bool

    var isEmpty: Bool {
        return elements.isEmpty
    }

    var count: Int {
        return elements.count
    }

    init(isHigherPriority: @escaping (Int, Int) -> Bool) {
        self.isHigherPriority = isHigherPriority
    }

    mutating func enqueue(_ element: Int) {
        elements.append(element)
        siftUp(elements.count - 1)
    }

    mutating func dequeue() -> Int? {
        guard !isEmpty else { return nil }

        elements.swapAt(0, elements.count - 1)
        let element = elements.removeLast()
        siftDown(0)

        return element
    }

    private mutating func siftUp(_ index: Int) {
        var childIndex = index
        var parentIndex = (childIndex - 1) / 2

        while childIndex > 0 && isHigherPriority(elements[childIndex], elements[parentIndex]) {
            elements.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }

    private mutating func siftDown(_ index: Int) {
        var parentIndex = index

        while true {
            let leftChildIndex = 2 * parentIndex + 1
            let rightChildIndex = 2 * parentIndex + 2
            var highestPriorityIndex = parentIndex

            if leftChildIndex < elements.count && isHigherPriority(elements[leftChildIndex], elements[highestPriorityIndex]) {
                highestPriorityIndex = leftChildIndex
            }

            if rightChildIndex < elements.count && isHigherPriority(elements[rightChildIndex], elements[highestPriorityIndex]) {
                highestPriorityIndex = rightChildIndex
            }

            if parentIndex == highestPriorityIndex {
                break
            }

            elements.swapAt(parentIndex, highestPriorityIndex)
            parentIndex = highestPriorityIndex
        }
    }
}

class Solution {
    func maxKelements(_ nums: [Int], _ k: Int) -> Int {
        var heap = PriorityQueue(isHigherPriority: >)
        var score = Int.zero

        nums.forEach { heap.enqueue($0) }

        for _ in 0..<k {
            guard let max = heap.dequeue() else {
                return score
            }

            score += max
            heap.enqueue(Int(ceil(Float(max) / 3)))
        }

        return score
    }
}
