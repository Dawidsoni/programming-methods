package l5.z1;

/**
 * Created by dawidwegner on 23/03/2017.
 */
class QueueNode<T extends Comparable<T>> {
    QueueNode<T> next;
    T val;

    QueueNode(T val, QueueNode<T> next) {
        this.val = val;
        this.next = next;
    }
}
