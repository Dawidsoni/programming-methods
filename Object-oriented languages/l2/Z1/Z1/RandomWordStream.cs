using System;
using System.Text;
namespace Z1
{
	public class RandomWordStream
	{
		private RandomStream randomStream = new RandomStream((int)'a', (int)'z' + 1);
		private PrimeStream primeStream = new PrimeStream();

		public bool Eos()
		{
			return primeStream.Eos();
		}

		public String Next()
		{
			int wordSize = primeStream.Next();
			StringBuilder strBuilder = new StringBuilder();
			for (int i = 0; i < wordSize; i++)
			{
				strBuilder.Append((char)randomStream.Next());
			}
			return strBuilder.ToString();
		}

		public void Reset()
		{
			primeStream.Reset();
		}
	}
}
