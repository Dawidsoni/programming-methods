using System;
using System.Collections.Generic;
namespace Z4
{
	public class LazyList
	{
		protected List<int> numList = new List<int>();
		protected Random randomGenerator = new Random();

		virtual protected int CreateElement()
		{
			return randomGenerator.Next();
		}

		public int Size()
		{
			return numList.Count;
		}

		public int Element(int index)
		{
			if (index <= numList.Count)
			{
				return numList[index - 1];
			}
			for (int i = numList.Count; i < index; i++)
			{
				numList.Add(CreateElement());
			}
			return numList[index - 1];
		}

	}
}
