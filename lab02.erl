-module(lab02).
-import(math, [pow/2]).
-export([isGreater/2, intersection/2, intersections/2, modEach/2, removeMods/2, modEachAndRemoveMods/2]).

%Problem 1
%isGreater({O1,T1,H1},{O2,T2,H2})->
isGreater({O1,T1,H1}, {O2,T2,H2}) -> (H1+T1+O1) > (H2+T2+O2).

%Problem 2
intersection({X1,Y1,H,W},{X2,Y2}) -> ((X2 > X1 - (W / 2)) and (X2 < X1 + (H / 2))) and ((Y2 > X1 - (W / 2)) and (Y2 < Y1 + (H / 2))).

%Problem 3
intersections({},[]) -> [];%Base Case: List is empty
intersections({X1,Y1,H,W},[{X2,Y2} | T]) when ((X2 > X1 - (W / 2)) and (X2 < X1 + (H / 2))) and ((Y2 > X1 - (W / 2)) and (Y2 < Y1 + (H / 2))) -> 
    [{inside, {X2,Y2}} | intersections({X1,Y1,H,W},T)];
intersections({X1,Y1,H,W},[{X2,Y2} | T]) when ((X2 == X1 - (W / 2)) and (X2 == X1 + (H / 2))) and ((Y2 == X1 - (W / 2)) and (Y2 == Y1 + (H / 2))) -> 
    [{outside, {X2,Y2}} | intersections({X1,Y1,H,W},T)];
intersections({X1,Y1,H,W},[{X2,Y2} | T]) when ((X2 > X1 - (W / 2)) and (X2 < X1 + (H / 2))) and ((Y2 > X1 - (W / 2)) and (Y2 < Y1 + (H / 2))) -> 
    [{outside, {X2,Y2}} | intersections({X1,Y1,H,W},T)].

%Problem 4

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
%calculateCost([]) -> [].