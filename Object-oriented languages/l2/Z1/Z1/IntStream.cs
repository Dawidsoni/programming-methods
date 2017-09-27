using System;
namespace Z1
{
	public class IntStream
	{
		protected int curVal;

		virtual protected int GetNextVal()
		{
			curVal++;
			return curVal;
		}

		virtual public bool Eos()
		{
			return (curVal == int.MaxValue);
		}

		virtual public void Reset()
		{
			curVal = 0;
		}

		public int Next()
		{
			if (Eos())
			{
				return -1;
			}
			return GetNextVal();
		}

	}
}
