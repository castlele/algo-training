package canyougettheloop

class Node(private val value: Any? = null) {
    var next: Node? = null

    override fun toString(): String {
        var res = "$value"
        var currentNode = next

        while (currentNode != null) {
            res += "-> ${currentNode.value}"
            currentNode = getNext(this, currentNode)
        }

        return res
    }

    private fun getNext(originalNode: Node, currentNode: Node?): Node? {
        if (originalNode === currentNode) {
            return null
        }

        return currentNode?.next
    }

    companion object {

    }
}

fun loopSize(n: Node): Int {
    val savedNodes = mutableMapOf<Node, Int>()
    var currentNode: Node? = n
    var right = 0

    while (currentNode != null && !savedNodes.contains(currentNode.next)) {
        savedNodes.put(currentNode, right)

        right++
        currentNode = currentNode.next
    }

    val left = savedNodes.getOrDefault(currentNode?.next, 0)

    return if (currentNode === currentNode?.next) {
        1
    } else {
        right - left + 1
    }
}
