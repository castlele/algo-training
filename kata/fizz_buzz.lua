require("cluautils.tests.base_test_case")

---@MARK - Helpers

function table.is_equal(l1, l2)
    if #l1 ~= #l2 then
        print("Tables are not equal. Got: " .. vim.inspect(l1) .. ". Expected: " .. vim.inspect(l2))
        return false
    end

    for index, value in ipairs(l1) do
        if l2[index] ~= value then
            print("Values by index: " .. index .. " are differs. " .. "L1: " .. l1[index] .. ". L2: " .. l2[index])
            return false
        end
    end

    return true
end

local function is_multiple_of(multiple, num)
    return num % multiple == 0
end

local function fizz_buzz(num)
    local message = ""

    if is_multiple_of(3, num) then
        message = message .. "Fizz"
    end

    if is_multiple_of(5, num) then
        message = message .. "Buzz"
    end

    if #message == 0 then
        return num
    end

    return message
end

---@MARK - API

---@class CRange
---@field lower number
---@field upper number
Range = { lower=1, upper=100 }

---@param range CRange?
---@param multiple_rules table?
---@return table
function FizzBuzz(range, multiple_rules)
    local fizz_buzz_arr = {}
    range = range or Range
    multiple_rules = multiple_rules or {fizz_buzz}

    for num = range.lower, range.upper, 1 do
        local message = ""

        for _, rule in pairs(multiple_rules) do
            local rule_message = rule(num) or ""

            if #message ~= 0 and tonumber(rule_message) ~= nil then
                message = message
            else
                message = message .. rule_message
            end
        end

        if tonumber(message) ~= nil then
            table.insert(fizz_buzz_arr, num)
        else
            table.insert(fizz_buzz_arr, message)
        end
    end

    return fizz_buzz_arr
end

---@MARK - Tests

FizzBuzzTests = CTestCase

FizzBuzzTests.fizzBuzz = { 1,2,"Fizz",4,"Buzz","Fizz",7,8,"Fizz","Buzz",11,"Fizz",13,14,"FizzBuzz",16,17,"Fizz",19,"Buzz","Fizz",22,23,"Fizz","Buzz",26,"Fizz",28,29,"FizzBuzz",31,32,"Fizz",34,"Buzz","Fizz",37,38,"Fizz","Buzz",41,"Fizz",43,44,"FizzBuzz",46,47,"Fizz",49,"Buzz","Fizz",52,53,"Fizz","Buzz",56,"Fizz",58,59,"FizzBuzz",61,62,"Fizz",64,"Buzz","Fizz",67,68,"Fizz","Buzz",71,"Fizz",73,74,"FizzBuzz",76,77,"Fizz",79,"Buzz","Fizz",82,83,"Fizz","Buzz",86,"Fizz",88,89,"FizzBuzz",91,92,"Fizz",94,"Buzz","Fizz",97,98,"Fizz","Buzz" }
FizzBuzzTests.fizzBuzzFrom15to50 = { "FizzBuzz",16,17,"Fizz",19,"Buzz","Fizz",22,23,"Fizz","Buzz",26,"Fizz",28,29,"FizzBuzz",31,32,"Fizz",34,"Buzz","Fizz",37,38,"Fizz","Buzz",41,"Fizz",43,44,"FizzBuzz",46,47,"Fizz",49,"Buzz" }
FizzBuzzTests.fizzBuzzFooBoo = { 1,2,"Fizz",4,"Buzz","Fizz","Foo",8,"Fizz","Buzz","Boo","Fizz",13,"Foo","FizzBuzz",16,17,"Fizz",19,"Buzz","FizzFoo","Boo",23,"Fizz","Buzz",26,"Fizz","Foo",29,"FizzBuzz",31,32,"FizzBoo",34,"BuzzFoo","Fizz",37,38,"Fizz","Buzz",41,"FizzFoo",43,"Boo","FizzBuzz",46,47,"Fizz","Foo","Buzz","Fizz",52,53,"Fizz","BuzzBoo","Foo","Fizz",58,59,"FizzBuzz",61,62,"FizzFoo",64,"Buzz","FizzBoo",67,68,"Fizz","BuzzFoo",71,"Fizz",73,74,"FizzBuzz",76,"FooBoo","Fizz",79,"Buzz","Fizz",82,83,"FizzFoo","Buzz",86,"Fizz","Boo",89,"FizzBuzz","Foo",92,"Fizz",94,"Buzz","Fizz",97,"Foo","FizzBoo","Buzz" }
FizzBuzzTests.bigFizzBuzz = { 1, 2, "Fizz", 4, "Buzz", "Fizz", 7, 8, "Fizz", "Buzz", 11, "Fizz", 13, 14, "FizzBuzz", 16, 17, "Fizz", 19, "Buzz", "Fizz", 22, 23, "Fizz", "Buzz", 26, "Fizz", 28, 29, "FizzBuzz", 31, 32, "Fizz", 34, "Buzz", "Fizz", 37, 38, "Fizz", "Buzz", 41, "Fizz", 43, 44, "FizzBuzz", 46, 47, "Fizz", 49, "Buzz", "Fizz", 52, 53, "Fizz", "Buzz", 56, "Fizz", 58, 59, "FizzBuzz", 61, 62, "Fizz", 64, "Buzz", "Fizz", 67, 68, "Fizz", "Buzz", 71, "Fizz", 73, 74, "FizzBuzz", 76, 77, "Fizz", 79, "Buzz", "Fizz", 82, 83, "Fizz", "Buzz", 86, "Fizz", 88, 89, "FizzBuzz", 91, 92, "Fizz", 94, "Buzz", "BigFizz", "Big", "Big", "BigFizz", "BigBuzz" }
FizzBuzzTests.smallFizzBuzz = { "Small", "Small", "SmallFizz", "Small", "SmallBuzz", "SmallFizz", "Small", "Small", "SmallFizz", "SmallBuzz", "Small", "SmallFizz", "Small", "Small", "SmallFizzBuzz", 16, 17, "Fizz", 19, "Buzz", "Fizz", 22, 23, "Fizz", "Buzz", 26, "Fizz", 28, 29, "FizzBuzz", 31, 32, "Fizz", 34, "Buzz", "Fizz", 37, 38, "Fizz", "Buzz", 41, "Fizz", 43, 44, "FizzBuzz", 46, 47, "Fizz", 49, "Buzz", "Fizz", 52, 53, "Fizz", "Buzz", 56, "Fizz", 58, 59, "FizzBuzz", 61, 62, "Fizz", 64, "Buzz", "Fizz", 67, 68, "Fizz", "Buzz", 71, "Fizz", 73, 74, "FizzBuzz", 76, 77, "Fizz", 79, "Buzz", "Fizz", 82, 83, "Fizz", "Buzz", 86, "Fizz", 88, 89, "FizzBuzz", 91, 92, "Fizz", 94, "Buzz", "Fizz", 97, 98, "Fizz", "Buzz" }

function FizzBuzzTests:test_fizz_buzz()
    local expected = FizzBuzzTests.fizzBuzz

    local result = FizzBuzz()

    return table.is_equal(result, expected)
end

function FizzBuzzTests:test_range_15_to_50()
    local expected = FizzBuzzTests.fizzBuzzFrom15to50

    local result = FizzBuzz({lower=15, upper=50})

    return table.is_equal(result, expected)
end

function FizzBuzzTests:test_fizz_buzz_foo_boo()
    local expected = FizzBuzzTests.fizzBuzzFooBoo

    local result = FizzBuzz(nil, {
        function (num)
            local fizz_buzz_message = fizz_buzz(num)
            local foo_boo_message = ""

            if is_multiple_of(7, num) then
                foo_boo_message = foo_boo_message .. "Foo"
            end

            if is_multiple_of(11, num) then
                foo_boo_message = foo_boo_message .. "Boo"
            end

            if #foo_boo_message == 0 then
                return fizz_buzz_message
            end

            if fizz_buzz_message == num then
                return foo_boo_message
            end

            return fizz_buzz_message .. foo_boo_message
        end
    })

    return table.is_equal(result, expected)
end

function FizzBuzzTests:test_fizz_buzz_custom_large_rule()
    local expected = FizzBuzzTests.bigFizzBuzz

    local result = FizzBuzz(nil, {
        function (num) if num > 95 then return "Big" end end,
        fizz_buzz,
    })

    return table.is_equal(result, expected)
end

function FizzBuzzTests:test_fizz_buzz_custom_small_rule()
    local expected = FizzBuzzTests.smallFizzBuzz

    local result = FizzBuzz(nil, {
        function (num) if num < 16 then return "Small" end end,
        fizz_buzz,
    })

    return table.is_equal(result, expected)
end

FizzBuzzTests:run_tests()
