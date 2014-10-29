-module(steam).

-export([retrieve/0, start/0]).



start() ->

ssl:start(),
application:start(inets),
retrieve().

retrieve () ->

{ok,{_,_,XML}}=httpc:request(get, {"http://api.steampowered.com/IPlayerService/GetSteamLevel/v1/?key=80C9F831FD044A94E0A0FE0792624CD4&steamid=76561197960435530", []},[], []),
XML.

