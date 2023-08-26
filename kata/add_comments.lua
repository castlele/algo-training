require("cluautils.tests.base_test_case")
require("cluautils.string_utils")

---@param str string
---@return number?
local function get_indent(str)
    local s, e = str:find("^%s+")

    if s == nil then
        return nil
    end

    return e
end

---@param lines table
---@return number
local function get_min_indent(lines)
    local min_indent = 1000000

    for _, line in pairs(lines) do
        local indent_index = get_indent(line)

        if indent_index == nil then
            return 0
        end

        if min_indent > indent_index then
            min_indent = indent_index
        end
    end

    return min_indent
end

---@param num number
---@return string
local function create_indent(num)
    local indent = ""

    for _ = 1, num, 1 do
        indent = indent .. " "
    end

    return indent
end

---@param prefix string
---@param author string
---@param params table?
---@return string
local function create_header(prefix, author, params)
    local header = {prefix .. "Author: " .. author}

    for key, value in pairs(params or {}) do
        local line = prefix .. tostring(key):upper() .. ": " .. value

        table.insert(header, line)
    end

    return table.concat(header, "\n")
end

---@param comment_prefix string
---@param input_string string
---@param author string
---@param params table?
---@return string
function Comment(comment_prefix, input_string, author, params)
    if input_string:is_empty() then
        return comment_prefix .. " Author: " .. author
    end

    local commented_lines = input_string:split("\n")
    local min_indent_index = get_min_indent(commented_lines)
    local min_indent = create_indent(min_indent_index)

    for index, line in ipairs(commented_lines) do
        if not line:is_empty() and line:trim():find(comment_prefix) ~= 1 then
            local current_indent_index = get_indent(line) or min_indent_index
            local current_indent = create_indent(current_indent_index - min_indent_index)

            commented_lines[index] = min_indent .. comment_prefix .. " " ..current_indent .. line:triml()
        end
    end

    local header = create_header(min_indent .. comment_prefix .. " ", author, params)

    return header .. "\n" .. table.concat(commented_lines, "\n")
end

---@MARK - Tests

CommentsTests = CTestCase

function CommentsTests:test_add_comment_to_empty_string_gives_only_comment()
    local input_string = ""
    local author = "castlelecs"
    local comment_prefix = "//"

    local result = Comment(comment_prefix, input_string, author)

    return result == "// Author: " .. author
end

function CommentsTests:test_comment_one_none_comment_line_comments_it_and_adds_author()
    local input_string = "[self.editor.shapeEditor setVerticalAlignment:alignment];"
    local author = "castlelecs"
    local comment_prefix = "//"

    local result = Comment(comment_prefix, input_string, author)

    return result == "// Author: " .. author .. "\n// " .. input_string
end

function CommentsTests:test_comment_one_commented_line_only_adds_author()
    local input_string = "// [self.editor.shapeEditor setVerticalAlignment:alignment];"
    local author = "castlelecs"
    local comment_prefix = "//"

    local result = Comment(comment_prefix, input_string, author)

    return result == "// Author: " .. author .. "\n" .. input_string
end

function CommentsTests:test_comment_one_indented_none_commented_line_adds_author_and_comment_after_indentation()
    local indentation = "        "
    local input_string = "[self.editor.shapeEditor setVerticalAlignment:alignment];"
    local author = "castlelecs"
    local comment_prefix = "//"

    local result = Comment(comment_prefix, indentation .. input_string, author)

    return result == indentation .. "// Author: " .. author .. "\n" .. indentation .. "// " .. input_string
end

function CommentsTests:test_comment_one_indented_commented_line_adds_author()
    local indentation = "        "
    local input_string = "// [self.editor.shapeEditor setVerticalAlignment:alignment];"
    local author = "castlelecs"
    local comment_prefix = "//"

    local result = Comment(comment_prefix, indentation .. input_string, author)

    return result == indentation .. "// Author: " .. author .. "\n" .. indentation .. input_string
end

function CommentsTests:test_comment_two_none_commented_lines_adds_author_and_comments()
    local indentation = ""
    local line_1 = "[self.editor.shapeEditor setVerticalAlignment:alignment];\n"
    local line_2 = "self.currentAlignment = alignment;"
    local author = "castlelecs"
    local comment_prefix = "//"

    local result = Comment(comment_prefix, indentation .. line_1 .. indentation .. line_2, author)

    return result == indentation .. "// Author: " .. author .. "\n" .. indentation .. "// " .. line_1 .. "// " .. line_2
end

function CommentsTests:test_comment_two_commented_lines_adds_only_author()
    local indentation = ""
    local line_1 = "// [self.editor.shapeEditor setVerticalAlignment:alignment];\n"
    local line_2 = "// self.currentAlignment = alignment;"
    local author = "castlelecs"
    local comment_prefix = "//"

    local result = Comment(comment_prefix, indentation .. line_1 .. indentation .. line_2, author)

    return result == indentation .. "// Author: " .. author .. "\n" .. indentation .. line_1 .. line_2
end

function CommentsTests:test_comment_two_none_commented_indented_lines_adds_author_and_comments()
    local indentation = "    "
    local line_1 = "[self.editor.shapeEditor setVerticalAlignment:alignment];\n"
    local line_2 = "self.currentAlignment = alignment;"
    local author = "castlelecs"
    local comment_prefix = "//"

    local result = Comment(comment_prefix, indentation .. line_1 .. indentation .. line_2, author)

    return result == indentation .. "// Author: " .. author .. "\n" .. indentation .. "// " .. line_1 .. indentation .. "// " .. line_2
end

function CommentsTests:test_comment_two_none_commented_differently_indented_lines_adds_author_and_comments_at_min_indent()
    local indentation_1 = "    "
    local indentation_2 = indentation_1 .. indentation_1
    local line_1 = "[self.editor.shapeEditor setVerticalAlignment:alignment];\n"
    local line_2 = "self.currentAlignment = alignment;"
    local author = "castlelecs"
    local comment_prefix = "//"

    local result = Comment(comment_prefix, indentation_1 .. line_1 .. indentation_2 .. line_2, author)

    return result == indentation_1 .. "// Author: " .. author .. "\n" .. indentation_1 .. "// " .. line_1 .. indentation_1 .. "// " .. indentation_1 .. line_2
end

function CommentsTests:test_comment_two_commented_differently_indented_lines_adds_author_and_comments_at_min_indent()
    local indentation_1 = "    "
    local indentation_2 = indentation_1 .. indentation_1
    local line_1 = "// [self.editor.shapeEditor setVerticalAlignment:alignment];\n"
    local line_2 = "// self.currentAlignment = alignment;"
    local author = "castlelecs"
    local comment_prefix = "//"

    local result = Comment(comment_prefix, indentation_1 .. line_1 .. indentation_2 .. line_2, author)

    return result == indentation_1 .. "// Author: " .. author .. "\n" .. indentation_1 .. line_1 .. indentation_2 .. line_2
end

function CommentsTests:test_add_todo_comment()
    local input_string = "[self.editor.shapeEditor setVerticalAlignment:alignment];"
    local author = "castlelecs"
    local todo = "Change with CoreInterfaces"
    local comment_prefix = "//"

    local result = Comment(comment_prefix, input_string, author, {TODO=todo})

    return result == "// Author: " .. author .. "\n// TODO: " .. todo .. "\n// " .. input_string
end

CommentsTests:run_tests()
