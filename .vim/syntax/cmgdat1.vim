syn case ignore



syn match Comment "\*\*.*"
syn match Include "\*INCLUDE"
syn match Include "INCLUDE"
syn match Number "[0-9]"
syn match Error "<cmost>.*</cmost>"
syn match Error "<cmost>.*</cmost>" contained
syn match String "'.*'" contains=Error



syn keyword Include MOD SHUTIN 
syn keyword Identifier GRID RESULTS WRST INUNIT WSRF  OUTSRF WPRN OUTPRN PERMI PERMJ PERMK  PINCHOUTARRAY CPOR PVCUTOFF RUN DATE FILENAME SIMULATOR CORNER
syn keyword Identifier PHASEID ROCKFLUID INITIAL VERTICAL NREGIONS REFPRES DWOC SWOC REFDEPTH CDEPTH DATUMDEPTH NUMERICAL RTYPE TRANSF
syn keyword Identifier ALTER DTMAX DTWELL
syn keyword Error cmost <CMOST> </cmost> </CMOST> LOOKUP tst 

let b:current_syntax = "cmgdat"

