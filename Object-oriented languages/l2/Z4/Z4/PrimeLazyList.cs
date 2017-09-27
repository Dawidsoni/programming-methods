using System;
namespace Z4
{
	public class PrimeLazyList : LazyList
	{
		private bool IsPrime(int num)
		{
			for (int i = 2; i < num; i++)
			{
				if (num % i == 0)
				{
					return false;
				}
			}
			return true;
		}

		private int FindNextPrime(int minVal)
		{
			while (IsPrime(minVal) == false)
			{
				minVal++;
			}
			return minVal;
		}

		protected override int CreateElement()
		{
			if (numList.Count == 0)
			{
				return 2;
			}
			return FindNextPrime(numList[numList.Count - 1] + 1);
		}

	}
}
