---@param str string
---@param cols integer
---@return string
function Wrap(str, cols)
    if #str <= cols then
        return str
    end

    if str:sub(cols, cols) == " " then
        return ("%s%s%s"):format(str:sub(1, cols - 1), "\n", Wrap(str:sub(cols + 1, #str), cols))

    elseif str:sub(cols - 1, cols - 1) == " " then
        return ("%s%s%s"):format(str:sub(1, cols - 2), "\n", Wrap(str:sub(cols, #str), cols))

    elseif str:sub(cols + 1, cols + 1) == " " then
        return ("%s%s%s"):format(str:sub(1, cols), "\n", Wrap(str:sub(cols + 2, #str), cols))
    end

    return ("%s%s%s"):format(str:sub(1, cols), "\n", Wrap(str:sub(cols + 1, #str), cols))
end

-- MARK: - Tests

local WrapperTests = {}

function WrapperTests.emptyString()
    assert(Wrap("", 1) == "", "emptyString is failed")
end

function WrapperTests.wordIsShorterThanColumnsCount()
    assert(Wrap("hello", 10) == "hello", "wordIsShorterThanColumnsCount is failed")
end

function WrapperTests.wordIsLongerThanColumnsCount()
    assert(Wrap("hello", 3) == "hel\nlo", "wordIsLongerThanColumnsCount is failed")
end

function WrapperTests.wordContainsMoreThanOneColumns()
    local wrappedStr = Wrap("hellohellohellohello", 5)

    assert(wrappedStr == "hello\nhello\nhello\nhello", "wordContainsMoreThanOneColumns is failed, result is: " .. wrappedStr)
end

function WrapperTests.twoWordsColumnsAtSpace()
    local wrappedStr = Wrap("hello hello", 6)

    assert(wrappedStr == "hello\nhello", "twoWordsColumnsAtSpace is failed, result is: " .. wrappedStr)
end

function WrapperTests.threeWordsColumnsAtSpaces()
    local wrappedStr = Wrap("hello hello hello", 6)

    assert(wrappedStr == "hello\nhello\nhello", "twoWordsColumnsAtSpace is failed, result is: " .. wrappedStr)
end

function WrapperTests.threeWordsColumnAtSecondSpace()
    local wrappedStr = Wrap("hello hello hello", 12)

    assert(wrappedStr == "hello hello\nhello", "twoWordsColumnsAtSpace is failed, result is: " .. wrappedStr)
end

function WrapperTests.columnsAfterSpace()
    local wrappedStr = Wrap("hello hello", 7)

    assert(wrappedStr == "hello\nhello", "twoWordsColumnsAtSpace is failed, result is: " .. wrappedStr)
end

function WrapperTests.columnsBeforeSpace()
    local wrappedStr = Wrap("hello hello", 5)

    assert(wrappedStr == "hello\nhello", "twoWordsColumnsAtSpace is failed, result is: " .. wrappedStr)
end

-- MARK: - Tests running

for test_name, test in pairs(WrapperTests) do
    print("Running test case: " .. test_name)
    test()
    print("Test case: " .. test_name .. " succeed")
end
