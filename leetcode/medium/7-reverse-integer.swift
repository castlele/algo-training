import Foundation

class Solution {
    func reverse(_ x: Int) -> Int {
        var mutableX = abs(x)
        var result = 0

        while mutableX != 0 {
            let remainder = mutableX % 10
            mutableX /= 10
            result = (result * 10) + remainder

            guard result <= Int32.max else {
                return .zero
            }
        }

        return x >= 0 ? result : result * -1
    }
}
