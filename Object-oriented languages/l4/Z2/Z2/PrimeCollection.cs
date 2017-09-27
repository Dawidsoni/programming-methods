using System;
using System.Collections;
namespace Z2
{
	public class PrimeCollection : IEnumerable
	{
		IEnumerator IEnumerable.GetEnumerator()
		{
			return new PrimeEnumerator();
		}
	}
}
