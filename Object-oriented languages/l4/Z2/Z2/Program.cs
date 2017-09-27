using System;

namespace Z2
{
	class MainClass
	{
		public static void Main(string[] args)
		{
			var primeList = new PrimeCollection();
			foreach (var it in primeList)
			{
				Console.WriteLine(it);
				if ((int)it > 100)
				{
					break;
				}
			}
		}
	}
}
