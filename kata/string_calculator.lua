---@param str string
---@return integer | string
function CalculateString(str)
    local sum = 0

    for str_digit in string.gmatch(str, "[+-]?%d+") do
        local digit = tonumber(str_digit)

        if digit < 0 then
            return "negatives not allowed"
        end

        if digit <= 1000 then
            sum = sum + digit
        end
    end

    print(sum)

    return sum
end

---@MARK - Tests

StringCalculatorTests = {}

function StringCalculatorTests:test_empty_string()
    local input_string = ""
    local expected_int = 0

    local calculated_int = CalculateString(input_string)

    assert(calculated_int == expected_int)
end

function StringCalculatorTests:test_one_number_in_string()
    local input_string = "1"
    local expected_int = 1

    local calculated_int = CalculateString(input_string)

    assert(calculated_int == expected_int)
end

function StringCalculatorTests:test_two_numbers_comma_delimiter()
    local input_string = "1,2"
    local expected_int = 3

    local calculated_int = CalculateString(input_string)

    assert(calculated_int == expected_int)
end

function StringCalculatorTests:test_two_numbers_new_line_delimiter()
    local input_string = "5\n4"
    local expected_int = 9

    local calculated_int = CalculateString(input_string)

    assert(calculated_int == expected_int)
end

function StringCalculatorTests:test_three_numbers_delimited_by_new_line_and_comma()
    local input_string = "5\n4,4"
    local expected_int = 13

    local calculated_int = CalculateString(input_string)

    assert(calculated_int == expected_int)
end

function StringCalculatorTests:test_negatives_not_allowed_exception()
    local input_string = "5\n-4,4"
    local expected_output = "negatives not allowed"

    local calculated_int = CalculateString(input_string)

    assert(calculated_int == expected_output)
end

function StringCalculatorTests:test_ignoring_of_1000()
    local input_string = "1,1001"
    local expected_output = 1

    local calculated_int = CalculateString(input_string)

    assert(calculated_int == expected_output)
end

---@MARK: - Tests running

for test_name, test in pairs(StringCalculatorTests) do
    print("Running test case: " .. test_name)
    test()
    print("Test case: " .. test_name .. " succeed")
end
