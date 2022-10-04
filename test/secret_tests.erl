-module(secret_tests).

-include_lib("eunit/include/eunit.hrl").

wrap_test_() ->
    [ ?_assert(undefined =:= secret:wrap(undefined))
    , ?_assert(is_function(secret:wrap("password"), 0))
    , ?_assert(is_function(secret:wrap(<<"password">>), 0))
    , ?_assert(
         begin
             Wrapped0 = secret:wrap(<<"password">>),
             Wrapped1 = secret:wrap(Wrapped0),
             Wrapped0 =:= Wrapped1
         end)
    ].

unwrap_test_() ->
    Wrapped0 = secret:wrap(<<"password">>),
    Wrapped1 = fun() -> Wrapped0 end,
    [ ?_assert(<<"password">> =:= secret:unwrap(Wrapped0))
    , ?_assert(<<"password">> =:= secret:unwrap(Wrapped1))
    ].
