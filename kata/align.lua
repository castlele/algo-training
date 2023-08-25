require("cluautils.tests.base_test_case")
require("cluautils.string_utils")

function string:repeate(times)
    local result = ""

    for _ = 1, times, 1 do
        result = result .. self
    end

    return result
end

---@param text string
---@param sep string
---@return string
function Align(text, sep)
    local lines = text:split("\n")

    if #lines == 1 then
        return text
    end

    local indices = {}
    local max = 0

    for line_index, line in pairs(lines) do
        local sep_index = line:find(sep)

        if sep_index == nil then
            return text
        end

        if indices[max] == nil or indices[max] < sep_index then
            max = line_index
        end

        table.insert(indices, sep_index)
    end

    for line_index, line in pairs(lines) do
        if line_index == max then
            goto continue
        end

        local diff = indices[max] - indices[line_index]
        local aligning_spaces = (" "):repeate(diff)
        local first_part = string.sub(line, 1, indices[line_index] - 1)
        local last_part = string.sub(line, indices[line_index])

        print(first_part .. aligning_spaces .. last_part)
        lines[line_index] = first_part .. aligning_spaces .. last_part

        ::continue::
    end

    return table.concat(lines, "\n")
end

---@MARK - Tests

AlignTests = CTestCase

function AlignTests:test_align_one_line_do_nothing()
    local text = "Hello, world"
    local sep = ","

    local result = Align(text, sep)

    return result == text
end

function AlignTests:test_align_two_lines_by_none_existing_separator_do_nothing()
    local text = [[
    Hello, world
    Hello, world]]
    local sep = "|"

    local result = Align(text, sep)

    return result == text
end

function AlignTests:test_align_two_lines_by_separator_from_one_line_do_nothing()
    local text = [[
    Hello, world
    Hello. world]]
    local sep = "."

    local result = Align(text, sep)

    return result == text
end

function AlignTests:test_align_two_equal_lines_do_nothing()
    local text = [[
    Hello, world
    Hello, world]]
    local sep = ","

    local result = Align(text, sep)

    return result == text
end

function AlignTests:test_align_lines_with_different_len_align_by_max_separator_index()
    local text = [[
    SOME_STR: char
    SOME_OTHER_STR: char
    INT_VALUE: int]]
    local sep = ":"

    local result = Align(text, sep)

    return result == [[
    SOME_STR      : char
    SOME_OTHER_STR: char
    INT_VALUE     : int]]
end

AlignTests:run_tests()
