using System;
using System.Collections.Generic;
namespace Z3
{
	public interface IGraph
	{
		void Reset(List<String> vertexList);
		void AddEdge(String v1, String v2);
		void GenerateRandomGraph(List<String> vertexList, int eCount);
		List<String> GetNeighbours(String vertex);
	}
}
