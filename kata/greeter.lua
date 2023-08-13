TIME = nil

DAYTIME = {
    MORNING = os.time { year=2023, month=8, day=10, hour=10, min=0 },
    EVENING = os.time { year=2023, month=8, day=10, hour=18, min=0 },
    NIGHT = os.time { year=2023, month=8, day=10, hour=22, min=0 },
}

---@MARK - Greet

local function triml(str)
    return string.gsub(str, "%s+$", "")
end

local function trimr(str)
    return string.gsub(str, "^%s+", "")
end

local function trim(str)
    return trimr(triml(str))
end

---@param name string
---@return string
function Greet(name)
    local greet = "Hello"
    local trimmed_name = trim(name)
    local first_letter = trimmed_name:sub(1, 1):upper()
    name = first_letter .. trimmed_name:sub(2, #trimmed_name)

    if TIME == DAYTIME.MORNING then
        greet = "Good morning"
    elseif TIME == DAYTIME.EVENING then
        greet = "Good evening"
    elseif TIME == DAYTIME.NIGHT then
        greet = "Good night"
    end

    local greeting = greet .. " " .. name

    print("'" .. greeting .. "'")
    return greeting
end

---@MARK - Tests

GreetTests = {}

function GreetTests:test_greet_name()
    local name = "World"
    local expected_greet = "Hello World"

    local greet = Greet(name)

    assert(greet == expected_greet)
end

function GreetTests:test_trim_white_space_end_of_the_word()
    local name = "World   "
    local expected_greet = "Hello World"

    local greet = Greet(name)

    assert(greet == expected_greet)
end

function GreetTests:test_trim_white_space_begging_of_the_word()
    local name = "     World"
    local expected_greet = "Hello World"

    local greet = Greet(name)

    assert(greet == expected_greet)
end

function GreetTests:test_trim_white_space_at_both_sides()
    local name = "     World       "
    local expected_greet = "Hello World"

    local greet = Greet(name)

    assert(greet == expected_greet)
end

function GreetTests:test_greet_with_capitalization()
    local name = "world"
    local expected_greet = "Hello World"

    local greet = Greet(name)

    assert(greet == expected_greet)
end

function GreetTests:test_greet_in_the_morning()
    local name = "world"
    local expected_greet = "Good morning World"
    TIME = DAYTIME.MORNING

    local greet = Greet(name)
    TIME = nil

    assert(greet == expected_greet)
end

function GreetTests:test_greet_in_the_evening()
    local name = "world"
    local expected_greet = "Good evening World"
    TIME = DAYTIME.EVENING

    local greet = Greet(name)
    TIME = nil

    assert(greet == expected_greet)
end

function GreetTests:test_greet_in_the_night()
    local name = "world"
    local expected_greet = "Good night World"
    TIME = DAYTIME.NIGHT

    local greet = Greet(name)
    TIME = nil

    assert(greet == expected_greet)
end

---@MARK: - Tests running

for test_name, test in pairs(GreetTests) do
    print("Running test case: " .. test_name)
    test()
    print("Test case: " .. test_name .. " succeed")
end
