-module(lab02).
-import(math, [pow/2]).
-export([isGreater/2, intersection/2, intersections/2, modEach/2, removeMods/2, modEachAndRemoveMods/2, intersectionPartition/2, calculateCost/1, calculateTotalCost/1, generate/3, myMinMax/1, getLastIndex/2]).

%Problem 1
isGreater({O1,T1,H1}, {O2,T2,H2}) -> {H1,T1,O1} > {H2,T2,O2}.

%Problem 2
intersection({X1,Y1,H,W},{X2,Y2}) -> ((X2 > X1 - (W / 2)) and (X2 < X1 + (H / 2))) and ((Y2 > X1 - (W / 2)) and (Y2 < Y1 + (H / 2))).

%Problem 3
intersections(_,[]) -> [];%Base Case: List is empty
intersections({X1,Y1,H,W},[{X2,Y2} | T]) when ((X2 > X1 - (W / 2)) and (X2 < X1 + (H / 2))) and ((Y2 > X1 - (W / 2)) and (Y2 < Y1 + (H / 2))) -> 
    [{inside, {X2,Y2}} | intersections({X1,Y1,H,W},T)];
intersections({X1,Y1,H,W},[{X2,Y2} | T]) -> 
    [{outside, {X2,Y2}} | intersections({X1,Y1,H,W},T)].

%Problem 4
intersectionPartition(Rectangle, Points) -> 
    ClassifiedList = intersections(Rectangle, Points),
    partitionHelper([],[],ClassifiedList).



partitionHelper(InList, OutList, []) -> {InList, OutList};
partitionHelper(InList, OutList, [{Location, Tuple} | T]) when(Location =:= inside) ->
    partitionHelper([Tuple | InList], OutList, T);
partitionHelper(InList, OutList, [{_, Tuple} | T]) ->
    partitionHelper(InList, [Tuple | OutList], T).


%{[{0.5,0.5}],[{1,2},{300,4000},...]}

%Problem 5
modEach([],_) ->[];
modEach([H | T], M) ->
    [H rem M | modEach(T, M)].

%Problem 6
removeMods([],_) -> [];
removeMods([H | T], M) when (H rem M == 0) ->
    removeMods(T, M);
removeMods([H | T], M) when (H rem M /= 0) ->
    [H | removeMods(T, M)].

%Problem 7
modEachAndRemoveMods([],_) ->[];
modEachAndRemoveMods([H | T], M) when (H rem M == 0) ->
    modEachAndRemoveMods(T, M);
modEachAndRemoveMods([H | T], M) when (H rem M /= 0) ->
    [H rem M | modEachAndRemoveMods(T, M)].

%Problem 8
calculateCost([]) -> [];
calculateCost([{Item, Price, Quan, Tax}|T]) ->
    [{Item, Quan, (Price * Quan) + (Price * Quan * Tax)} | calculateCost(T)].

%Problem 9
calculateTotalCost(List) -> calculateCostHelper({0,0}, List).

calculateCostHelper(Tuple,[]) -> Tuple;
calculateCostHelper({TotalPrice, TotalQuantity},[{_, Quan, Price} | T]) -> 
    calculateCostHelper({TotalPrice + (Price * Quan), TotalQuantity + Quan}, T).

%Problem 10
%RAN IN THE SHELL (See screenshots)
%L = [{apples, 0.99,10,0.1},{oranges, 1.5, 20, 0.1},{peaches, 2.2, 5, 0.1}, {grapes, 5, 2, 0.1}, {melons, 1.75, 1, 0.1}].
%calculateTotalCost(calculateCost(L)).

%Problem 11
generate(Lower, Upper, _) when(Lower > Upper) -> [];%Base Case
generate(Lower, Upper, Interval) -> [Lower | generate(Lower + Interval, Upper, Interval)].

%Problem 12
myMinMax([]) -> empty_list;
myMinMax([H | T]) -> myMMHelper({H,H}, T).


myMMHelper(Tuple, []) -> Tuple;
myMMHelper({CurrMin, CurrMax}, [H | T]) when (H < CurrMin) -> myMMHelper({H, CurrMax}, T);
myMMHelper({CurrMin, CurrMax}, [H | T]) when (H > CurrMax) -> myMMHelper({CurrMin, H}, T);
myMMHelper({CurrMin, CurrMax}, [_ | T]) -> myMMHelper({CurrMin, CurrMax}, T).

%Problem 13

getLastIndex([], _) -> no_such_element;
getLastIndex(List, Target) -> myIndexHelper(-1, Target, 0, List).

myIndexHelper(LastHit, _, _, []) when(LastHit < 0) -> no_such_element;
myIndexHelper(LastHit, _, _, []) -> LastHit;
myIndexHelper(_, Target, Index, [H | T]) when(H =:= Target) -> myIndexHelper(Index, Target, Index + 1, T);
myIndexHelper(LastHit, Target, Index, [_ | T]) -> myIndexHelper(LastHit, Target, Index + 1, T).


