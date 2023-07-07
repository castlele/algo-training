func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {
    var sum = Int.zero

    for i in 0..<k {
        sum += nums[i]
    }

    var res = sum

    for i in k..<nums.count {
        sum += nums[i] - nums[i - k]
        res = max(res, sum)
    }

    return Double(res) / Double(k)
}

print(findMaxAverage([1,12,-5,-6,50,3], 4))
print(findMaxAverage([5], 1))
