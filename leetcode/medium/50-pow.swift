func myPow(_ x: Double, _ n: Int) -> Double {
    guard abs(x) != 1.0 else {
        return n % 2 == 0 ? abs(x) : x
    }

    var result = 1.0
    var mn = abs(n / 2)

    while mn != 0 {
        result *= x
        mn -= 1
    }

    result *= result

    if n % 2 != 0 {
        result *= x
    }

    return n < 0 ? 1 / result : result
}

print(myPow(2.0, 10) == 1024.0)
print(myPow(2.1, 3) == 9.26100)
print(myPow(2, -2) == 0.25000)

print(myPow(2.0, 10))
print(myPow(2.1, 3))
print(myPow(2, -2))
print(myPow(1.0000000000001, -2147483648))
