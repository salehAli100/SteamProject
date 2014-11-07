-module(test).

-export([retrieve/0, start/0]).




start() ->

ssl:start(),
application:start(inets),
retrieve().

retrieve () ->

{ok,{_,_,JSON}}=httpc:request(get, {"http://api.steampowered.com/ISteamUser/GetFriendList/v0001/?key=80C9F831FD044A94E0A0FE0792624CD4&steamid=76561197960435530&relationship=friend", []},[], []),

Struct=mochijson:decode(JSON),

{struct, JsonData} = Struct,
{struct, Job} = proplists:get_value("friendslist",JsonData),
{array, Data} = proplists:get_value("friends",Job),
A=[parse(N) || N <- Data],
Playlist=[findgames(X) || X <- A],
Games=[mochijson:decode(C) || C <- Playlist],


io:format("Games: ~p.", [Games]).



parse(S) ->
{struct, Hey} = S,
D=proplists:get_value("steamid",Hey),
C=string:strip(D, both, $"),
C.


findgames(A) ->
{ok,{_,_,JSON}}=httpc:request(get, {"http://api.steampowered.com/IPlayerService/GetOwnedGames/v0001/?key=80C9F831FD044A94E0A0FE0792624CD4&steamid="++A++"&format=json", []},[], []),
JSON.


