using System;
namespace Z1
{
	public class RandomStream : IntStream
	{
		protected Random randomGenerator = new Random();
		protected int minVal, maxVal;

		public RandomStream()
		{
			this.minVal = 0;
			this.maxVal = int.MaxValue;
		}

		public RandomStream(int minVal, int maxVal)
		{
			this.minVal = minVal;
			this.maxVal = maxVal;
		}

		protected override int GetNextVal()
		{
			return randomGenerator.Next(minVal, maxVal);
		}

		public override bool Eos()
		{
			return false;
		}

	}
}
