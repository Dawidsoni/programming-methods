using System;
namespace Z1
{
	public class PrimeStream : IntStream
	{
		private bool IsPrime(int val)
		{
			if (val < 2)
			{
				return false;
			}
			for (int i = 2; i < val; i++)
			{
				if (val % i == 0)
				{
					return false;
				}
			}
			return true;
		}

		protected override int GetNextVal()
		{
			do
			{
				curVal++;
			} while (IsPrime(curVal) == false && curVal != int.MaxValue);
			return curVal;
		}
	}
}
