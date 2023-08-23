infix operator |>: AdditionPrecedence

public func |><T, V>(lhs: T, rhs: (T) -> V) -> V {
    rhs(lhs)
}
