package l6.z1;

import java.io.Serializable;

/**
 * Created by dawidwegner on 30/03/2017.
 */
public class LinkedList<T extends Serializable> implements Serializable {
    private ListNode<T> firstNode, lastNode;

    private void pushFirst(T elem) {
        firstNode = new ListNode<T>(elem);
        lastNode = firstNode;
    }

    public void pushBegin(T elem) {
        if(firstNode == null) {
            pushFirst(elem);
        }else {
            ListNode<T> node = new ListNode<T>(elem);
            node.linkWithNode(firstNode);
            firstNode = node;
        }
    }

    public void pushEnd(T elem) {
        if(firstNode == null) {
            pushFirst(elem);
        }else {
            ListNode<T> node = new ListNode<T>(elem);
            lastNode.linkWithNode(node);
            lastNode = node;
        }
    }

    public T removeBegin() {
        T result = firstNode.elem;
        firstNode = firstNode.next;
        if (firstNode == null) {
            lastNode = null;
            return result;
        }
        firstNode.prev = null;
        return result;
    }

    public T removeEnd() {
        T result = lastNode.elem;
        lastNode = lastNode.prev;
        if (lastNode == null) {
            firstNode = null;
            return result;
        }
        lastNode.next = null;
        return result;
    }

    public boolean isEmpty() {
        return (firstNode == null);
    }

}
