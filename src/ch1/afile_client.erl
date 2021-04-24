-module(afile_client).
-export([ls/1, get_file/2, ruok/1, put_file/2]).

ls(Server) ->
  Server ! {self(), list_dir},
  receive {Server, FileList} ->
    FileList
  end.

get_file(Server, File) ->
  Server ! {self(), {get_file, File}},
  receive {Server, Content} ->
    Content
  end.

ruok(Server) ->
  Server ! {self(), ruok},
  receive {Server, Reply} ->
    Reply
  end.

put_file(Server, FilePath) ->
  {ok,Bytes} = file:read_file(FilePath),
  FileName = filename:basename(FilePath),
  Server ! {self(), {put_file, FileName, Bytes}},
  receive {Server, Reply} ->
    Reply
  end.