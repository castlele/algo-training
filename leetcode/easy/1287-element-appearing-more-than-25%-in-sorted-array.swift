class Solution {
    func findSpecialInteger(_ arr: [Int]) -> Int {
        var map = [Int: Int]()

        for el in arr {
            guard let count = map[el] else {
                map[el] = 1
                continue
            }

            let per = getPercent(of: count + 1, in: arr)

            if per > 0.25 {
                return el
            }

            map[el] = count + 1
        }

        return .zero
    }

    func getPercent(of numb: Int, in arr: [Int]) -> Float {
        Float(numb) / Float(arr.count)
    }
}
