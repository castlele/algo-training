package logwriterkotlin

public class ResultWithLogs<T>(public val result: T, public var logs: Array<String>) {
}