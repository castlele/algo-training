package logwriterkotlin

public final class LogWriter {
    companion object {
        fun <T> wrap(obj: T): ResultWithLogs<T> {
            return ResultWithLogs<T>(obj, emptyArray<String>())
        }

        fun <T> run(resultWithLogs: ResultWithLogs<T>, transform: (obj: T) -> ResultWithLogs<T>): ResultWithLogs<T> {
            val transformedObject = transform(resultWithLogs.result)
            val logs = resultWithLogs.logs + transformedObject.logs

            return ResultWithLogs<T>(transformedObject.result, logs)
        }
    }
}