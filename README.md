http://api.steampowered.com/ISteamApps/GetAppList/v0001/

This link must be used to retrieve all the game names for app ids, since the other getschemaforgame link does not work with all games.


Go to the sample data folder and compile all the modules, then open Erlang and run main:start(). It should retrieve all the data and save it in Riak.
