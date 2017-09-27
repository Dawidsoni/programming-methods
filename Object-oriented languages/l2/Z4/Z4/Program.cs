using System;

namespace Z4
{
	class MainClass
	{
		public static void LazyListTest()
		{
			Console.WriteLine("LazyListTest");
			LazyList lazyList = new LazyList();
			Console.WriteLine(lazyList.Size());
			Console.WriteLine("3: {0}", lazyList.Element(3));
			Console.WriteLine(lazyList.Size());
			Console.WriteLine("5: {0}", lazyList.Element(5));
			Console.WriteLine(lazyList.Size());
			Console.WriteLine("3: {0}", lazyList.Element(3));
			Console.WriteLine(lazyList.Size());
			Console.WriteLine("6: {0}", lazyList.Element(6));
			Console.WriteLine(lazyList.Size());
			Console.WriteLine("6: {0}",lazyList.Element(6));
			for (int i = 10; i <= 20; i++)
			{
				lazyList.Element(i);
			}
			Console.WriteLine(lazyList.Size());
		}

		public static void PrimeLazyListTest()
		{
			Console.WriteLine("PrimeLazyListTest");
			LazyList lazyList = new PrimeLazyList();
			Console.WriteLine(lazyList.Size());
			Console.WriteLine("1: {0}", lazyList.Element(1));
			Console.WriteLine(lazyList.Size());
			Console.WriteLine("5: {0}", lazyList.Element(5));
			Console.WriteLine(lazyList.Size());
			Console.WriteLine("3: {0}", lazyList.Element(3));
			Console.WriteLine(lazyList.Size());
			for (int i = 10; i <= 20; i++)
			{
				lazyList.Element(i);
			}
			Console.WriteLine(lazyList.Size());
		}


		public static void Main(string[] args)
		{
			LazyListTest();
			Console.WriteLine();
			PrimeLazyListTest();
		}
	}
}
