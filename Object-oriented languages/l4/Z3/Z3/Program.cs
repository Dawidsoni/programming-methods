using System;
using System.Collections.Generic;
namespace Z3
{
	class MainClass
	{
		private static List<String> GetSampleVList()
		{
			return new List<String> { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j" };
		}

		private static List<String> GetSampleVList(int count)
		{
			var result = new List<String>();
			for (int i = 1; i <= count; i++)
			{
				result.Add(i.ToString());
			}
			return result;
		}

		private static int? Bfs(IGraph graph, String v1, String v2)
		{
			var vQueue = new Queue<Tuple<String, int>>();
			var visitedList = new HashSet<String>();
			vQueue.Enqueue(new Tuple<String, int>(v1, 0));
			visitedList.Add(v1);
			while (vQueue.Count > 0)
			{
				var vertex = vQueue.Peek().Item1;
				var dist = vQueue.Peek().Item2;
				vQueue.Dequeue();
				foreach (var it in graph.GetNeighbours(vertex))
				{
					if (it == v2)
					{
						return dist + 1;
					}
					if (visitedList.Contains(it) == false)
					{
						visitedList.Add(it);
						vQueue.Enqueue(new Tuple<String, int>(it, dist + 1));
					}
				}
			}
			return null;
		}

		private static void GraphTest(IGraph graph)
		{
			graph.AddEdge("a", "b");
			graph.AddEdge("a", "c");
			graph.AddEdge("b", "c");
			Console.WriteLine(Bfs(graph, "a", "d") == null);
			graph.AddEdge("b", "d");
			Console.WriteLine(Bfs(graph, "a", "d") == 2);
			graph.GenerateRandomGraph(GetSampleVList(), 4);
			Console.WriteLine("\nRandom graph1:");
			Console.WriteLine(graph);
			graph.GenerateRandomGraph(GetSampleVList(), 6);
			Console.WriteLine("\nRandom graph2:");
			Console.WriteLine(graph);
			graph.GenerateRandomGraph(GetSampleVList(10000), 100000);
			Console.WriteLine(Bfs(graph, "1", "10000"));
		}

		private static void ListGraphTest()
		{
			Console.WriteLine("listGraphTest");
			IGraph graph = new ListGraph(GetSampleVList());
			GraphTest(graph);
		}

		private static void MatrixGraphTest()
		{
			Console.WriteLine("matrixGraphTest");
			IGraph graph = new MatrixGraph(GetSampleVList());
			GraphTest(graph);
		}

		public static void Main(string[] args)
		{
			ListGraphTest();
			Console.WriteLine();
			MatrixGraphTest();			
		}
	}
}
