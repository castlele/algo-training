require("cluautils.tests.base_test_case")
require("cluautils.table_utils")

---@generic T, V
---@param callback fun(element: T):V
---@return table
function table:flat_map(callback)
    local result = {}

    for _, value in pairs(self) do
        if type(value) == "table" then
            for _, inner_value in pairs(value) do
                table.insert(result, callback(inner_value))
            end
        else
            table.insert(result, callback(value))
        end
    end

    return result
end

---@MARK - Tests

FlatMapTests = CTestCase

function FlatMapTests:test_flat_map_on_empty_table_gives_empty_table()
    local testing_table = {}

    local flatted_table = table.flat_map(testing_table, function (num) return num end)

    return table.is_equal(flatted_table, testing_table)
end

function FlatMapTests:test_flat_map_on_nested_tables_gives_flat_table()
    local testing_table = {{}}

    local flatted_table = table.flat_map(testing_table, function (num) return num end)

    return table.is_equal(flatted_table, {})
end

function FlatMapTests:test_flat_map_on_nested_tables_applies_callback_to_every_element()
    local testing_table = {{1,2,3,4}, {5,6,7,8,9}}

    local flatted_table = table.flat_map(testing_table, function (num) return num * 2 end)

    return table.is_equal(flatted_table, {2,4,6,8,10,12,14,16,18})
end

FlatMapTests:run_tests()
