public func getPrimeFactor(from number: Int) -> [Int] {
    var result = [Int]()
    var delimiter = 2
    var number = number

    while number > 1 {
        while number % delimiter == 0 {
            result.append(delimiter)
            number /= delimiter
        }

        delimiter += 1
    }

    return result
}
