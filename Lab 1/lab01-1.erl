- module(lab01).
- export([velocity/2, isSame/2, isDifferent/2, sign/1, dayOfTheWeek/1, sum/1, divide/2, myPerfectSqrt/1, myPerfectSqrt/3, labStatistics/1, labOne/0]).

%problem 1: function to calculate velocity
velocity(D, T)->
    D/T.

%problem2 : funtion to check if two numbers are same 
isSame(A, B) ->
    A == B.

%problem3: function to check if two numbers are different
isDifferent(A, B)->
    A =/= B.

%problem4: function to ditermine sign
sign(X) when X > 0 ->
    positive;
sign(X) when X<0 ->
    negative;
sign(_) ->
    zero.

%problem5: function to determine the day of the week 
dayOfTheWeek(Day) when Day =:= 1->
    monday;
dayOfTheWeek(Day) when Day =:= 2->
    tuesday;
dayOfTheWeek(Day) when Day =:= 3->
    wednesday;
dayOfTheWeek(Day) when Day =:= 4->
    thursday;
dayOfTheWeek(Day) when Day =:= 5->
    friday;
dayOfTheWeek(Day) when Day =:= 6->
    weekday;
dayOfTheWeek(Day) when Day =:= 7->
    weekday;
dayOfTheWeek(_)->
    no_match.

%problem6: funtion to calcculate PerfectSqrt

myPerfectSqrt(M) -> myPerfectSqrt(M, 1, 0).

myPerfectSqrt(M, _, A) when M =:= 0-> 
    A;
myPerfectSqrt(M, N, A) when M>0 ->
    myPerfectSqrt(M - N, N + 2, A + 1);

myPerfectSqrt(_, _, _)-> 
    not_perfect.

%problem7: function mySum 
sum(Boundary) when Boundary>0 ->
    Boundary+ sum(Boundary-1);
sum(0) -> 0.

 %problem 8: function divide that returns a signle integer after division.
divide(A, B) when A < B ->
    0;
divide(A, B) when A>=B -> 
  1+ divide(A-B, B).



%problem10: prints the contribution of each team member in the team . 
labStatistics({leader, Name, Point}) ->
   io:format("LEADER: ~p's contribution was ~p%~n", [Name, Point*100]);

labStatistics({student, Name, Point})->
   io:format("  ~p's contribution was ~p%~n", [Name, Point*100]).

%problem11: function lab() calls function labStatistics.
labOne() -> labStatistics({leader, "Harman Singh", 1.0}),
labStatistics({student, "Maliha Hossain", 1.0}),
labStatistics({student, "Zarif Mazumder", 1.0}).


