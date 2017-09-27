using System;
namespace Z2
{
	class DictionaryNode<Key, Val>
	{
		public Key key;
		public Val val;
		public DictionaryNode<Key, Val> next, prev;

		public DictionaryNode(Key key, Val val)
		{
			this.key = key;
			this.val = val;
			this.prev = null;
			this.next = null;
		}

		public DictionaryNode(Key key, Val val, DictionaryNode<Key, Val> prev, DictionaryNode<Key, Val> next)
		{
			this.key = key;
			this.val = val;
			this.prev = prev;
			this.next = next;
		}

		public void LinkWithNode(DictionaryNode<Key, Val> nextNode)
		{
			this.next = nextNode;
			nextNode.prev = this;
		}

		public void RemoveNode()
		{
			if (prev != null && next == null)
			{
				prev.next = null;
			}
			else if (prev == null && next != null)
			{
				next.prev = null;
			}
			else if (prev != null && next != null)
			{
				prev.next = next;
				next.prev = prev;
			}
		}
	}
}
