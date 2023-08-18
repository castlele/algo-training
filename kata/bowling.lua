require("cluautils.tests.base_test_case")

---@MARK - Private API

local rolls = {}
local current_roll = 1

local function is_strike(frame)
    return rolls[frame] == 10
end

local function is_spare(frame)
    return rolls[frame] + rolls[frame + 1] == 10
end

local function get_spare_bonus(frame)
    return 10 + rolls[frame + 2]
end

local function get_strike_bunus(frame)
    return 10 + rolls[frame + 1] + rolls[frame + 2]
end

local function sum_of_bolls_in_frame(frame)
    return rolls[frame] + rolls[frame + 1]
end

---@MARK - API

function NewGame()
    rolls = {}
    current_roll = 1
end

function Roll(pins)
    table.insert(rolls, current_roll, pins)
    current_roll = current_roll + 1
end

function GetScore()
    local score = 0
    local frame_index = 1

    for _ = 1, 10, 1 do
        if is_strike(frame_index) then
            score = score + get_strike_bunus(frame_index)
            frame_index = frame_index + 1
        elseif is_spare(frame_index) then
            score = score + get_spare_bonus(frame_index)
            frame_index = frame_index + 2
        else
            score = score + sum_of_bolls_in_frame(frame_index)
            frame_index = frame_index + 2
        end
    end

    return score
end

---@MARK - Tests

local function roll_multiple_times(times, pins)
    for _ = 1, times, 1 do
        Roll(pins)
    end
end

local function roll_spare()
    roll_multiple_times(2, 5)
end

local function roll_strike()
    Roll(10)
end

BowlingTets = CTestCase

function BowlingTets:set_up()
    NewGame()
end

---@MARK - Test cases

function BowlingTets:test_roll_zero()
    roll_multiple_times(20, 0)

    return GetScore() == 0
end

function BowlingTets:test_roll_ones()
    roll_multiple_times(20, 1)

    return GetScore() == 20
end

function BowlingTets:test_spare()
    roll_spare()
    Roll(3)
    roll_multiple_times(17, 0)

    return GetScore() == 16
end

function BowlingTets:test_strike()
    roll_strike()
    Roll(3)
    Roll(3)
    roll_multiple_times(17, 0)

    return GetScore() == 22
end

function BowlingTets:test_all_strikes()
    roll_multiple_times(12, 10)

    return GetScore() == 300
end

BowlingTets:run_tests()
