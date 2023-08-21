require("cluautils.tests.base_test_case")
require("cluautils.table_utils")

---@generic T
---@param callback fun(element: T):boolean
---@return table
function table:filter(callback)
    local result = {}

    for _, value in pairs(self) do
        if callback(value) then
            table.insert(result, value)
        end
    end

    return result
end

---@MARK - Tests

FilterTests = CTestCase

function FilterTests:test_filter_empty_table()
    local testable_table = {}

    local filtered_table = table.filter(testable_table, function (_) return true end)

    return table.is_equal(filtered_table, {})
end

function FilterTests:test_filter_table_with_no_callback()
    local testable_table = {1, 2, 3, 4}

    local filtered_table = table.filter(testable_table, function (_) return true end)

    return table.is_equal(filtered_table, testable_table)
end

function FilterTests:test_filter_table_for_even_numbers()
    local testable_table = {1, 2, 3, 4}

    local filtered_table = table.filter(testable_table, function (el) return el % 2 == 0  end)

    return table.is_equal(filtered_table, {2, 4})
end

FilterTests:run_tests()
