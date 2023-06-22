class Solution {

    func maxDistToClosest(_ seats: [Int]) -> Int {
        var left = 0
        var result = 0

        for right in 0..<seats.count {
            if seats[right] == 1 {
                if seats[left] == 0 {
                    result = max(result, right)
                } else {
                    result = max(result, (right - left) / 2)
                }

                left = right

            } else {
                if right == seats.count - 1 {
                    result = max(result, right - left)
                }
            }
        }

        return result
    }
}
