%Names: Harman Singh, Zarif Mazumder, Maliha Hossain

-module(lab03tests).
-include_lib("eunit/include/eunit.hrl").

%Module QA Test Cases
%orderElement(OrderId, Cost, Quantity, Tax) = {OrderId, Cost, Quantity, Tax}

empty_list_test() ->
    ?assertEqual([], qa:calculateTotals([])).

list_of_zeros_test() ->
    ?assertEqual([{0,0}], qa:calculateTotals([{0,0,0,0}])).

list_of_negative_orderID_test() ->
    ?assertEqual([],qa:calculateTotals([{-1,10,1,0.1}])).

list_of_negative_Cost_test() ->
    ?assertEqual([],qa:calculateTotals([{12,-1,1,0.1}])).

list_of_negative_Quantity_test() ->
    ?assertEqual([],qa:calculateTotals([{12,10,-1,0.1}])).

list_of_negative_Tax_test() ->
    ?assertEqual([],qa:calculateTotals([{12,10,1,-0.1}])).

one_order_test()->
    ?assertEqual([{123,189.81}],qa:calculateTotals([{123, 9.99, 10, 0.9}])).

two_orders_test() ->
    ?assertEqual([{123,189.81},{456,164.4}], qa:calculateTotals([{123, 9.99, 10, 0.9},{456, 5.48, 20, 0.5}])).


float_for_quan_test()->
    ?assertEqual([],qa:calculateTotals([{123,1.5,3.2,0.9}])).

float_for_ID_test()->
    ?assertEqual([],qa:calculateTotals([{12.3,1.5,3,0.9}])).

one_invalid_order_test() ->
    ?assertEqual([{123,189.81}],qa:calculateTotals([{123, 9.99, 10, 0.9},{12.3,1.5,3,0.9}])).

atom_for_ID_test() ->
    ?assertEqual([], qa:calculateTotals([{abc, 10, 1, 0.9}])).

atom_for_Cost_test() ->
    ?assertEqual([], qa:calculateTotals([{123, cost, 1, 0.9}])).

atom_for_Quan_test() ->
    ?assertEqual([], qa:calculateTotals([{123, 10, quantity, 0.9}])).

atom_for_Tax_test() ->
    ?assertEqual([], qa:calculateTotals([{123, 10, 1, tax}])).

tax_gt_1_test() ->
    ?assertEqual([], qa:calculateTotals([{123, 10, 1, 5.0}])).

list_for_ID_test() ->
    ?assertEqual([], qa:calculateTotals([{[1223,4454], 10, 1, 5.0}])).

zero_for_ID_test() ->
    ?assertEqual([{0,19.2}], qa:calculateTotals([{0,12,1,0.6}])).

zero_for_Cost_test() ->
    ?assertEqual([{123,0}], qa:calculateTotals([{123,0,1,0.6}])).

zero_for_Quan_test() ->
    ?assertEqual([{123,0}], qa:calculateTotals([{123,12,0,0.6}])).

zero_for_Tax_test() ->
    ?assertEqual([{123,12}], qa:calculateTotals([{123,12,1,0}])).


%***************************Map Reduce Test Cases *************************************************************
% empty_list_map_test() ->
%     Acc = 1,
%     ?assertEqual(Acc, lab03:mapReduce(fun lab03:flip/1, fun(X, Prod) -> X*Prod end, Acc, [])).
% list_with_one_element_test() ->
%     Acc = 1,
%     ?assertEqual(-12,lab03:mapReduce(fun lab03:flip/1, fun(X, Prod) -> X*Prod end, Acc, [12])).
% list_with_zero_as_element_test() ->
%     Acc = 1,
%     ?assertEqual(0,lab03:mapReduce(fun lab03:flip/1, fun(X, Prod) -> X*Prod end, Acc, [0])).
%****************************Partition Test Cases************************************************

% empty_list_partition_test() ->
%     ?assertEqual({[],[]}, lab03:myPartition(fun(X) -> X == 1 end, [])).

% all_predicate_partition_test() ->
%     ?assertEqual({[1,1,1,1,1,1],[]}, lab03:myPartition(fun(X) -> X == 1 end, [1,1,1,1,1,1])).

% none_predicate_partition_test() ->
%     ?assertEqual({[],[1,1,1,1,1,1]}, lab03:myPartition(fun(X) -> X == 2 end, [1,1,1,1,1,1])).

% average_case_test() ->
%     ?assertEqual({[a,b,c,d,e],[1,2,3,4]}, lab03:myPartition(fun(X) -> is_atom(X) end, [a,b,1,c,d,2,3,4,e])).

