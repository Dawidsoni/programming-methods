using System;
using System.Collections.Generic;
using System.Text;
namespace Z3
{
	public class ListGraph : IGraph
	{
		private Dictionary<String, List<String>> graph;

		public ListGraph(List<String> vertexList)
		{
			Reset(vertexList);
		}

		public void Reset(List<String> vertexList)
		{
			graph = new Dictionary<String, List<String>>();
			foreach (var it in vertexList)
			{
				graph[it] = new List<String>();
			}
		}

		public void AddEdge(String v1, String v2)
		{
			graph[v1].Add(v2);
			graph[v2].Add(v1);
		}

		public void GenerateRandomGraph(List<String> vertexList, int eCount)
		{
			Reset(vertexList);
			var randomGenerator = new Random();
			for (int i = 0; i < eCount; i++)
			{
				int v1 = randomGenerator.Next(0, vertexList.Count);
				int v2 = randomGenerator.Next(0, vertexList.Count);
				AddEdge(vertexList[v1], vertexList[v2]);
			}
		}

		public List<String> GetNeighbours(String vertex)
		{
			return graph[vertex];
		}

		public override String ToString()
		{
			StringBuilder result = new StringBuilder();
			foreach (var vertex in graph)
			{
				result.Append(vertex.Key + ": ");
				foreach (var edge in vertex.Value)
				{
					result.Append(edge + " ");
				}
				result.Append("\n");
			}
			return result.ToString();
		}
	}
}
