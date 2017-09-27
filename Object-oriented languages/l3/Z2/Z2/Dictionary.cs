using System;
using System.Collections.Generic;
namespace Z2
{
	public class Dictionary<Key, Val>
	{
		private DictionaryNode<Key, Val> firstNode;
		private EqualityComparer<Key> keyComparer;

		private bool IsEqualsKey(Key key1, Key key2)
		{
			return keyComparer.Equals(key1, key2);
		}

		private DictionaryNode<Key, Val> TryFindNode(Key key)
		{
			var node = firstNode;
			while (node != null)
			{
				if (IsEqualsKey(node.key, key))
				{
					return node;
				}
				node = node.next;
			}
			return null;
		}

		public Dictionary()
		{
			keyComparer = EqualityComparer<Key>.Default;
		}

		public Val Find(Key key)
		{
			return TryFindNode(key).val;
		}

		public void Add(Key key, Val val)
		{
			if (TryFindNode(key) != null)
			{
				throw new Exception("Key is already in Dictionary");
			}
			if (firstNode == null)
			{
				firstNode = new DictionaryNode<Key, Val>(key, val);
			}
			else
			{
				var node = new DictionaryNode<Key, Val>(key, val);
				node.LinkWithNode(firstNode);
				firstNode = node;
			}
		}

		public void Remove(Key key)
		{
			var node = TryFindNode(key);
			if (node == firstNode)
			{
				firstNode = firstNode.next;
			}
			node.RemoveNode();
		}

	}
}
