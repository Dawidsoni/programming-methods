import Data.List as DList
import Data.Set as DSet

newtype OptGraph a = OptGraph (Int, Int -> Set Int, Int -> a, a -> Int)

newtype ListGraph a = ListGraph ([a], a -> [a])

class Graph graph where
    createGraph :: Ord a => [a] -> (a -> [a]) -> graph a
    nodes :: Ord a => graph a -> Set a
    neighbours :: Ord a => graph a -> a -> Set a
    opt :: Ord a => graph a -> OptGraph a
    opt graph = OptGraph (vCount, edgeFunc, numFunc, lblFunc) where
      vSet = nodes graph
      vCount = DSet.size vSet
      numFunc = flip DSet.elemAt vSet
      lblFunc = flip DSet.findIndex vSet
      edgeFunc num = DSet.map lblFunc (neighbours graph $ numFunc num)
    graphEq :: (Eq a, Ord a) => graph a -> graph a -> Bool
    graphEq graph1 graph2 = (vList1 == vList2 && isEqVertexList) where
      vList1 = DSet.toList $ nodes graph1
      vList2 = DSet.toList $ nodes graph2
      isEqVertexList = DList.all vEqFunc vList1
      vEqFunc vtx = (neighbours graph1 vtx == neighbours graph2 vtx)

instance Graph OptGraph where
  createGraph vList eFunc =
    opt $ ListGraph (vList, eFunc)
  nodes (OptGraph (vCount, _, numFunc, _)) =
    DSet.fromList $ DList.map numFunc [0..(vCount - 1)]
  neighbours (OptGraph (_, edgeFunc, numFunc, labelFunc)) vertex =
     DSet.map numFunc (edgeFunc $ labelFunc vertex)
  opt graph = graph

instance Graph ListGraph where
  createGraph vList eFunc =
    ListGraph (vList, eFunc)
  nodes (ListGraph (vList, _)) =
    DSet.fromList vList
  neighbours (ListGraph (_, edgeFunc)) vtx =
    DSet.fromList $ edgeFunc vtx

printGraph :: (Ord a, Show a, Graph graph) => graph a -> IO ()
printGraph graph = putStrLn graphStr where
  vList = DSet.toList $ nodes graph
  vListStrFunc list = DList.map show list
  vStr = (show $ vListStrFunc vList) ++ "\n"
  nStrFunc vtx = vListStrFunc $ DSet.toList (neighbours graph vtx)
  eStrFunc vtx = show (show vtx, nStrFunc vtx)
  eListStr = DList.map eStrFunc vList
  eStr = DList.intercalate "\n" eListStr
  graphStr = vStr ++ eStr

getLineList :: Int -> IO ([String])
getLineList count = do
  if count == 0 then do
    return []
  else do
    line <- getLine
    tail <- getLineList (count - 1)
    return $ line : tail

getEdgeListEntry :: (Ord a) => String -> (String -> a) -> (a, [a])
getEdgeListEntry edgeStr vtxFunc = (vtx, neighList) where
  (vtxStr, neighStrList) = read edgeStr
  vtx = vtxFunc vtxStr
  neighList = DList.map vtxFunc neighStrList

createEdgeFunc :: (Ord a) => [(a, [a])] -> a -> [a]
createEdgeFunc eList vtx = case DList.lookup vtx eList of
  Just neighList -> neighList
  Nothing -> []

getGraph :: (Ord a, Graph graph) => (String -> a) -> IO (graph a)
getGraph vtxFunc = do
  vListStr <- getLine
  let vList = DList.map vtxFunc $ read vListStr
  eStrList <- getLineList (DList.length vList)
  let eMapFunc eStr = getEdgeListEntry eStr vtxFunc
  let eList = DList.map eMapFunc eStrList
  let eFunc = createEdgeFunc eList
  return $ createGraph vList eFunc

getListGraph :: (Ord a) => (String -> a) -> IO (ListGraph a)
getListGraph vtxFunc = getGraph vtxFunc

getOptGraph :: (Ord a) => (String -> a) -> IO (OptGraph a)
getOptGraph vtxFunc = getGraph vtxFunc
