using System;
using Z1;
class Program
{
	static void IntStreamTest()
	{
		Console.WriteLine("IntStreamTest");
		IntStream stream = new IntStream();
		for (int i = 1; i <= 3; i++)
		{
			Console.WriteLine(stream.Next());
		}
		stream.Reset();
		Console.WriteLine(stream.Next());
		stream.Reset();
		for (int i = 1; i < int.MaxValue - 1; i++)
		{
			stream.Next();
		}
		for (int i = 1; i <= 3; i++)
		{
			Console.WriteLine(stream.Eos());
			Console.WriteLine(stream.Next());
		}
		Console.WriteLine(stream.Eos());
		stream.Reset();
		Console.WriteLine(stream.Next());
	}

	static void RandomStreamTest()
	{
		Console.WriteLine("RandomStreamTest");
		IntStream stream = new RandomStream();
		Console.WriteLine(stream.Eos());
		for (int i = 0; i < 10; i++)
		{
			Console.WriteLine(stream.Next());
		}
		Console.WriteLine(stream.Eos());
	}

	static void PrimeStreamTest()
	{
		Console.WriteLine("PrimeStreamTest");
		IntStream stream = new PrimeStream();
		for (int i = 0; i < 5; i++)
		{
			Console.WriteLine(stream.Next());
		}
		Console.WriteLine(stream.Eos());
		stream.Reset();
		Console.WriteLine(stream.Eos());
		Console.WriteLine(stream.Next());
	}

	static void RandomWordStreamTest()
	{
		Console.WriteLine("RandomWordStreamTest");
		RandomWordStream stream = new RandomWordStream();
		for (int i = 0; i < 5; i++)
		{
			Console.WriteLine(stream.Next());
		}
		Console.WriteLine(stream.Eos());
		stream.Reset();
		Console.WriteLine(stream.Eos());
		for (int i = 0; i < 5; i++)
		{
			Console.WriteLine(stream.Next());
		}
	}

	static void Main(string[] args)
	{
		IntStreamTest();
		Console.WriteLine();
		RandomStreamTest();
		Console.WriteLine();
		PrimeStreamTest();
		Console.WriteLine();
		RandomWordStreamTest();
	}
}
