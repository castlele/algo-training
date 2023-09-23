public protocol ResultWithLogs {
    associatedtype ResultType

    var result: ResultType { get }
    var logs: [String] { get }

    init(_ result: ResultType, _ logs: [String])
}
