using System;
namespace Z1
{
	public class LinkiedList<T>
	{
		private ListNode<T> firstNode, lastNode;

		private void PushFirst(T elem)
		{
			firstNode = new ListNode<T>(elem);
			lastNode = firstNode;
		}

		public void PushBegin(T elem)
		{
			if (firstNode == null)
			{
				PushFirst(elem);
			}
			else
			{
				ListNode<T> node = new ListNode<T>(elem);
				node.LinkWithNode(firstNode);
				firstNode = node;
			}
		}

		public void PushEnd(T elem)
		{
			if (firstNode == null)
			{
				PushFirst(elem);
			}
			else
			{
				ListNode<T> node = new ListNode<T>(elem);
				lastNode.LinkWithNode(node);
				lastNode = node;
			}
		}

		public T RemoveBegin()
		{
			T result = firstNode.elem;
			firstNode = firstNode.next;
			if (firstNode == null)
			{
				lastNode = null;
				return result;
			}
			firstNode.prev = null;
			return result;
		}

		public T RemoveEnd()
		{
			T result = lastNode.elem;
			lastNode = lastNode.prev;
			if (lastNode == null)
			{
				firstNode = null;
				return result;
			}
			lastNode.next = null;
			return result;
		}

		public bool IsEmpty()
		{
			return (firstNode == null);
		}
	}
}
