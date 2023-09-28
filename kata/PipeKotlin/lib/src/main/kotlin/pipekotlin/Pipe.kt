package pipekotlin

class Pipe<V>(var valueObject: V) {

    companion object {
        fun <T, R> start(onValue: T, closure: (T) -> R): Pipe<R> {
            return Pipe(closure(onValue))
        }
    }

    fun <R> pass(closure: (V) -> R): Pipe<R> {
        return Pipe(closure(valueObject))
    }

    fun evaluate(): V {
        return valueObject
    }
}
