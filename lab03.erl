%Names: Harman Singh, Zarif Mazumder, Maliha Hossain
-module(lab03).
-export([mapReduce/4, flip/1]).

mapReduce(MapFun, FoldFun, Acc, List) ->
    lists:foldl(FoldFun, Acc, lists:map(MapFun, List)).

flip(N) -> -1 * N.