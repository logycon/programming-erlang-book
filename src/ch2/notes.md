# Ch1 notes

### hello.erl
erlc hello.erl  
erl -noshell -s hello start -s init stop  

### file server/client
erl  
c(afile_server).  
c(afile_client).  
FileServer = afile_server:start(".").  
afile_client:ls(FileServer).  

FileServer ! { self(), ruok }.  
receive X -> X.  

