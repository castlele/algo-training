require("cluautils.tests.base_test_case")

---@param t1 table
---@param t2 table
---@return table
function Concat(t1, t2)
    for _, value in pairs(t2) do
        if #value ~= 0 then
            table.insert(t1, value)
        end
    end

    return t1
end

---@param str string
---@param sep string
---@return table
function Split(str, sep)
    -- "^(.-)"
    -- "(.*)$"
    if #str == 0 or #sep == 0 then
        return {str}
    end

    local matched = str:match("^(.-)" .. sep)

    if matched == nil then
        return {str}
    end

    local result = {}

    if matched ~= "" then
        table.insert(result, matched)
    end

    return Concat(result, Split(str:match(sep .. "(.*)$"), sep))
end

---@MARK - Tests

local function compare(t1, t2)
    if #t1 ~= #t2 then
        return false
    end

    for key, value in pairs(t1) do
        if t2[key] ~= value then
            return false
        end
    end

    return true
end

SplitTests = CTestCase

function SplitTests:test_split_empty_string()
    local string_to_split = ""
    local separator = "\n"

    local splitted = Split(string_to_split, separator)

    return compare(splitted, {string_to_split})
end

function SplitTests:test_split_with_empty_separator()
    local string_to_split = "Hello"
    local separator = ""

    local splitted = Split(string_to_split, separator)

    return compare(splitted, {string_to_split})
end

function SplitTests:test_split_word_with_character()
    local string_to_split = "Hello"
    local separator = "e"

    local splitted = Split(string_to_split, separator)

    return compare(splitted, {"H", "llo"})
end

function SplitTests:test_split_word_with_character_multiple_times()
    local string_to_split = "Hello"
    local separator = "l"

    local splitted = Split(string_to_split, separator)

    return compare(splitted, {"He", "o"})
end

function SplitTests:test_split_word_with_character_at_the_end_of_the_word()
    local string_to_split = "Hello"
    local separator = "o"

    local splitted = Split(string_to_split, separator)

    return compare(splitted, {"Hell"})
end

function SplitTests:test_split_word_with_character_at_the_start_of_the_word()
    local string_to_split = "Hello"
    local separator = "H"

    local splitted = Split(string_to_split, separator)

    return compare(splitted, {"ello"})
end

function SplitTests:test_split_two_words_by_space()
    local string_to_split = "Hello world"
    local separator = " "

    local splitted = Split(string_to_split, separator)

    return compare(splitted, {"Hello", "world"})
end

function SplitTests:test_split_three_words_by_space()
    local string_to_split = "Hello hello hello"
    local separator = " "

    local splitted = Split(string_to_split, separator)

    return compare(splitted, {"Hello", "hello", "hello"})
end

function SplitTests:test_split_two_words_by_new_line()
    local string_to_split = "Hello\nhello"
    local separator = "\n"

    local splitted = Split(string_to_split, separator)

    return compare(splitted, {"Hello", "hello"})
end

function SplitTests:test_split_two_words_in_multiline_string()
    local string_to_split = [[
Hello
hello]]
    local separator = "\n"

    local splitted = Split(string_to_split, separator)

    return compare(splitted, {"Hello", "hello"})
end

function SplitTests:test_split_json()
    local string_to_split = [[
{
    "hello": "world",
    "number": 1
}
]]
    local separator = "\n"

    local splitted = Split(string_to_split, separator)

    return compare(splitted, {"{", '    "hello": "world",', '    "number": 1', "}"})
end

SplitTests:run_tests()
