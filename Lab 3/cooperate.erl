-module(cooperate).
-export([producer/2, go/0, consumer/0]).

producer(_, []) -> ok;
producer(PID, [H | T]) ->
    io:format("process ~p producing ~p~n",[self(), H]),
    PID ! H,
    producer(PID, T).

consumer() ->
    timer:sleep(10),
    receive
        N -> io:format("process ~p consumes ~p~n", [self(), N]), 
        consumer()
    after 40 -> 
        io:format("Shutting down because nothing to consume!~n")
    end.

go() ->
    PID = spawn(cooperate, consumer, []),
    spawn(cooperate, producer, [PID,[1,2,3,4,5,6,7]]).