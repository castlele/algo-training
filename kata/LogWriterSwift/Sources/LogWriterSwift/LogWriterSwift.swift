public func wrapToLogs<T, R: ResultWithLogs>(_ type: T) -> R where R.ResultType == T {
    R(type, [])
}

public func runWithLogs<R: ResultWithLogs>(_ resultWithLogs: R, _ transform: (R.ResultType) -> R) -> R {
    let transformedResult = transform(resultWithLogs.result)

    return R(transformedResult.result, resultWithLogs.logs + transformedResult.logs)
}
