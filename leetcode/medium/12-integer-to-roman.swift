 class Solution {
    static let romans = [
        1: "I",
        4: "IV",
        5: "V",
        9: "IX",
        10: "X",
        40: "XL",
        50: "L",
        90: "XC",
        100: "C",
        400: "CD",
        500: "D",
        900: "CM",
        1000: "M",
    ]

    func intToRoman(_ num: Int) -> String {
        var result = [String]()
        var order = 1
        var mutableNum = num

        while mutableNum > 0 {
            var remainder = mutableNum % 10

            if let roman = Self.romans[remainder * order] {
                result.append(roman)
            } else if remainder < 5 {
                var num = ""

                while remainder != 0, let roman = Self.romans[order] {
                    remainder -= 1
                    num += roman
                }

                result.append(num)

            } else if remainder > 5 {
                var diff = remainder - 5

                guard var num = Self.romans[5 * order] else {
                    return result.reversed().joined()
                }

                while diff != 0, let roman = Self.romans[order] {
                    diff -= 1
                    num += roman
                }

                result.append(num)
            }

            mutableNum /= 10
            order *= 10
        }

        return result.reversed().joined()
    }
}
