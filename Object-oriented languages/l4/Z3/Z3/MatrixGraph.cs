using System;
using System.Collections.Generic;
using System.Text;
namespace Z3
{
	public class MatrixGraph : IGraph
	{
		private int[,] graph;
		private Dictionary<String, int> vertexMap;
		private Dictionary<int, String> numMap;

		private void AddEdge(int v1, int v2)
		{
			graph[v1, v2]++;
			graph[v2, v1]++;
		}

		public MatrixGraph(List<String> vertexList)
		{
			Reset(vertexList);
		}

		public void Reset(List<String> vertexList)
		{
			graph = new int[vertexList.Count, vertexList.Count];
			vertexMap = new Dictionary<String, int>();
			numMap = new Dictionary<int, String>();
			int counter = 0;
			foreach (var it in vertexList)
			{
				vertexMap.Add(it, counter);
				numMap.Add(counter, it);
				counter++;
			}
		}

		public void AddEdge(String v1, String v2)
		{
			AddEdge(vertexMap[v1], vertexMap[v2]);
		}

		public void GenerateRandomGraph(List<String> vertexList, int eCount)
		{
			Reset(vertexList);
			Random randomGenerator = new Random();
			for (int i = 0; i < eCount; i++)
			{
				int v1 = randomGenerator.Next(0, vertexList.Count);
				int v2 = randomGenerator.Next(0, vertexList.Count);
				AddEdge(v1, v2);
			}
		}

		public List<String> GetNeighbours(String vertex)
		{
			int vNum = vertexMap[vertex];
			var result = new List<String>();
			for (int i = 0; i < vertexMap.Count; i++)
			{
				if (graph[vNum, i] > 0)
				{
					result.Add(numMap[i]);
				}
			}
			return result;
		}

		public override string ToString()
		{
			StringBuilder result = new StringBuilder();
			for (int i = 0; i < vertexMap.Count; i++)
			{
				for (int j = 0; j < vertexMap.Count; j++)
				{
					result.Append(graph[i, j]);
					result.Append(" ");
				}
				result.Append("\n");
			}
			return result.ToString();
		}
	}
}
