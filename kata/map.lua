require("cluautils.tests.base_test_case")
require("cluautils.table_utils")

---@generic T
---@class lazy_list
---@field original_table table
---@field callback fun(T):T
LazyList = {
    original_table={},
    callback=function (value) return value end
}

---@return lazy_list
function LazyList:new(o, original_table, callback)
    o = o or {}

    setmetatable(o, self)

    self.__index = function (_, value)
        if type(value) ~= "number" then
            if value == "original_table" then
                return original_table
            end

            if value == "callback" then
                return callback
            end

            return nil
        end

        return callback(value)
    end

    self.original_table = original_table
    self.callback = callback

    return o
end

function LazyList:len()
    return #self.original_table
end

---@return table
function LazyList:as_table()
    local result = {}

    for index, _ in ipairs(self.original_table) do
        table.insert(result, self[index])
    end

    return result
end

---@generic T
---@param callback fun(talbe_element: T):T
---@return lazy_list
function table:lazy_map(callback)
    return LazyList:new({}, self, callback)
end

---@generic T
---@param callback fun(talbe_element: T):T
---@return table
function table:map(callback)
    local result = {}

    for _, value in pairs(self) do
        table.insert(result, callback(value))
    end

    return result
end

---@MARK - Test cases

MapTests = CTestCase

function MapTests:test_map_empty_table()
    local testable_table = {}

    local result_table = table.map(testable_table, function (value) return value end)

    return table.is_equal(result_table, {})
end

function MapTests:test_map_with_empty_callback()
    local testable_table = {1, 2, 3, 4}

    local result_table = table.map(testable_table, function (value) return value end)

    return table.is_equal(result_table, testable_table)
end

function MapTests:test_map_elements_doubled()
    local testable_table = {1, 2, 3, 4}

    local result_table = table.map(testable_table, function (value) return value * 2 end)

    return table.is_equal(result_table, {2, 4, 6, 8})
end

function MapTests:test_lazy_map_one_element_empty_callback()
    local testable_table = {1}

    local result_table = table.lazy_map(testable_table, function (value) return value end)

    return table.is_equal(LazyList.as_table(result_table), testable_table) and result_table[1] == 1
end

function MapTests:test_lazy_map_elements_doubled()
    local testable_table = {1, 2, 3, 4, 5, 6, 7, 8}

    local result_table = table.lazy_map(testable_table, function (value) return value * 2 end)
    local len = LazyList.len(result_table)

    return table.is_equal(LazyList.as_table(result_table),{2, 4, 6, 8, 10, 12, 14, 16}) and result_table[len] == 16
end

MapTests:run_tests()
