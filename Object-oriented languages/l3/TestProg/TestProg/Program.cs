using System;
using Z1;
using Z2;
namespace TestProg
{
	class MainClass
	{
		private static void LinkedListTest()
		{
			LinkiedList<int> list = new LinkiedList<int>();
			Console.WriteLine(list.IsEmpty());
			list.PushEnd(5);
			Console.WriteLine(list.IsEmpty());
			Console.WriteLine(list.RemoveBegin());
			Console.WriteLine(list.IsEmpty());
			for (int i = 0; i < 5; i++)
			{
				list.PushBegin(4 - i);
				list.PushEnd(5 + i);
				Console.WriteLine(list.RemoveEnd());
			}
			for (int i = 0; i < 2; i++)
			{
				Console.WriteLine(list.RemoveBegin());
				Console.WriteLine(list.RemoveEnd());
			}
			Console.WriteLine(list.RemoveEnd());
			Console.WriteLine(list.IsEmpty());
		}

		private static void DictionaryTest()
		{
			Dictionary<int, int> map = new Dictionary<int, int>();
			map.Add(1, 10);
			Console.WriteLine(map.Find(1));
			map.Add(2, 20);
			map.Add(3, 30);
			for (int i = 1; i <= 3; i++)
			{
				Console.WriteLine(map.Find(i));
			}
			map.Remove(2);
			Console.WriteLine(map.Find(1));
			Console.WriteLine(map.Find(3));
			map.Add(2, 200);
			Console.WriteLine(map.Find(2));
			map.Remove(2);
			map.Remove(1);
			Console.WriteLine(map.Find(3));
			map.Remove(3);
			map.Add(1, 100);
			Console.WriteLine(map.Find(1));
		}

		public static void Main(string[] args)
		{
			LinkedListTest();
			Console.WriteLine();
			DictionaryTest();
		}
	}
}
