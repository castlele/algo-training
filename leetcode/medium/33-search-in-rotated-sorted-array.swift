func search(_ nums: [Int], _ num: Int) -> Int {
    let pivot = getPivot(nums)

    if nums[pivot] == num {
        return pivot
    }

    if let index = binarySearch(nums, num, .zero, pivot != 0 ? pivot - 1 : nums.count - 1) {
        return index
    }

    if pivot != 0, let index = binarySearch(nums, num, pivot + 1, nums.count - 1) {
        return index
    }

    return -1
}

func binarySearch(_ nums: [Int], _ num: Int, _ left: Int, _ right: Int) -> Int? {
    var left = left
    var right = right

    while left <= right {
        let middle = (left + right) / 2

        if nums[middle] == num {
            return middle

        } else if nums[middle] > num {
            right = middle - 1

        } else {
            left = middle + 1
        }
    }

    return nil
}

func getPivot(_ arr: [Int]) -> Int {
    for index in 0..<arr.count {
        if (index - 1) >= 0, arr[index - 1] > arr[index] {
            return index
        }
    }

    return .zero
}

let arr = [4,5,6,7,0,1,2]

print(search(arr, 0) == 4)
print(search(arr, 3) == -1)
print(search([1], 0) == -1)
print(search([5, 1, 3], 3) == 2)
