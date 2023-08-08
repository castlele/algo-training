function Generate(v)
    local list = {}
    local divisor = 2

    while v > 1 do
        while v % divisor == 0 do
            table.insert(list, divisor)
            v = v / divisor
        end

        divisor = divisor + 1
    end

    return list
end

---@MARK - Helpers

function Is_Equal(t1, t2)
    if #t1 ~= #t2 then
        return false
    end

    for index, _ in ipairs(t1) do
        if t2[index] ~= t1[index] then
            return false
        end
    end

    return true
end

---@MARK - Tests

local PrimeFactorTests = {}

function PrimeFactorTests.test_one()
    local expected = {}

    local generated = Generate(1)

    assert(Is_Equal(expected, generated))
end

function PrimeFactorTests.test_two()
    local expected = {2}

    local generated = Generate(2)

    assert(Is_Equal(expected, generated))
end

function PrimeFactorTests.test_three()
    local expected = {3}

    local generated = Generate(3)

    assert(Is_Equal(expected, generated))
end

function PrimeFactorTests.test_four()
    local expected = {2,2}

    local generated = Generate(4)

    assert(Is_Equal(expected, generated))
end

function PrimeFactorTests.test_six()
    local expected = {2,3}

    local generated = Generate(6)

    assert(Is_Equal(expected, generated))
end

function PrimeFactorTests.test_eight()
    local expected = {2,2,2}

    local generated = Generate(8)

    assert(Is_Equal(expected, generated))
end

function PrimeFactorTests.test_nine()
    local expected = {3,3}

    local generated = Generate(9)

    assert(Is_Equal(expected, generated))
end

for test_name, test in pairs(PrimeFactorTests) do
    print("Running test case: " .. test_name)
    test()
    print("Test case: " .. test_name .. " succeed")
end
