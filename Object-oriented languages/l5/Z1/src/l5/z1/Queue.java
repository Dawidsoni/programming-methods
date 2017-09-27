package l5.z1;

/**
 * Created by dawidwegner on 23/03/2017.
 */
public class Queue<T extends Comparable<T>> {
    protected QueueNode<T> firstNode;

    private QueueNode<T> findLowerBound(T val) {
        QueueNode<T> node = firstNode;
        if(firstNode == null || firstNode.val.compareTo(val) > 0) {
            return null;
        }
        while (node.next != null && node.next.val.compareTo(val) < 0) {
            node = node.next;
        }
        return node;
    }

    public void push(T val) {
        QueueNode<T> lowerNode = findLowerBound(val);
        if(lowerNode == null && firstNode == null) {
            firstNode = new QueueNode<T>(val, null);
        }else if(lowerNode == null) {
            QueueNode<T> node = new QueueNode<T>(val, firstNode);
            firstNode = node;
        }else {
            QueueNode<T> node = new QueueNode<T>(val, lowerNode.next);
            lowerNode.next = node;
        }
    }

    public T pop() {
        T result = firstNode.val;
        firstNode = firstNode.next;
        return  result;
    }

    public String toString() {
        QueueNode<T> node = firstNode;
        StringBuilder result = new StringBuilder();
        result.append("Queue elements: ");
        while(node != null) {
            result.append(node.val.toString());
            result.append(" ");
            node = node.next;
        }
        return result.toString();
    }
}
