using System;
namespace Z1
{
	class ListNode<T>
	{
		public ListNode<T> prev, next;
		public T elem;

		public ListNode(T elem)
		{
			this.elem = elem;
			this.prev = null;
			this.next = null;
		}

		public ListNode(T elem, ListNode<T> prev, ListNode<T> next)
		{
			this.elem = elem;
			this.prev = prev;
			this.next = next;
		}

		public void LinkWithNode(ListNode<T> nextNode)
		{
			next = nextNode;
			nextNode.prev = this;
		}
	}
}
