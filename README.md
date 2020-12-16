OpenLR - Using Heaps.io

```===
Building
===```

Install Haxe, preferably latest

Install the following libraries ``haxelib install [lib name]``

For all targets

``haxelib install heaps``

For HashLink JIT/HashLink C

``haxelib install hlsdl``
``haxelib install hlopenal``

create new file named build.hxml

For targetting JavaScript, add the following parameters:
	
-cp src
-dce full
-main Main
-lib heaps
-js bin/js/openlr.js

Targetting Hashlink JIT

-cp src
-lib heaps
-lib hlsdl
-lib hlopenal
-hl bin/hl/OpenLR.hl

Targetting Hashlink C

-cp src
-lib heaps
-lib hlsdl
-lib hlopenal
-hl bin/c/main.c

Hashlink VM will be needed to run .hl files. To bundle it with an executable, rename ``OpenLR.hl`` to ``hlboot.dat`` and bundle it with the following files:
	
- fmt.hdll
- hl.exe
- libhl.dll
- openal.hdll
- OpenAL32.dll
- sdl.hdll
- SDL2.dll
- ui.hdll