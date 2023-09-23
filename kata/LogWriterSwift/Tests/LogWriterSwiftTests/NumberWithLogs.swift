import LogWriterSwift

struct NumberWithLogs: ResultWithLogs {
    let result: Int
    let logs: [String]

    init(_ result: Int, _ logs: [String]) {
        self.result = result
        self.logs = logs
    }
}
