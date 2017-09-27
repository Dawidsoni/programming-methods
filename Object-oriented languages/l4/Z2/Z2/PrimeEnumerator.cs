using System;
using System.Collections;
namespace Z2
{
	public class PrimeEnumerator : IEnumerator
	{
		private int curState;

		private bool IsPrime(int number)
		{
			for (int i = 2; i < number; i++)
			{
				if (number % i == 0)
				{
					return false;
				}
			}
			return true;
		}

		public PrimeEnumerator()
		{
			Reset();
		}

		public void Reset()
		{
			curState = 1;
		}

		public bool MoveNext()
		{
			curState++;
			if (curState < 0)
			{
				return false;
			}
			while (IsPrime(curState) == false)
			{
				curState++;
			}
			return true;
		}

		public object Current
		{
			get
			{
				return curState;
			}
		}

	}
}
