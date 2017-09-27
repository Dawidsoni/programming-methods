package l6.z1;

import java.io.Serializable;

/**
 * Created by dawidwegner on 30/03/2017.
 */
class ListNode<T extends Serializable> implements Serializable {
    public ListNode<T> prev, next;
    public T elem;

    public ListNode(T elem) {
        this.elem = elem;
        this.prev = null;
        this.next = null;
    }

    public ListNode(T elem, ListNode<T> prev, ListNode<T> next) {
        this.elem = elem;
        this.prev = prev;
        this.next = next;
    }

    public void linkWithNode(ListNode<T> nextNode) {
        next = nextNode;
        nextNode.prev = this;
    }
}
