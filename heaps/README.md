OpenLR - Using Heaps.io under the MIT license

```
 * Hi, thanks for viewing my source.
 * I'm not particularily concerned with making a build "for the community", I realized I had more fun worrying about what I wanted and building the engine to my needs.
 * This isn't to say I'm refusing to take feedback, obviously I'm interested if someone else besides me can see this comment.
 * 
 * I'm just not going to be focused on making this anything other than a personal engine. So please taper your expectations.
 * If you find use out of it, that's great, if not, well... you know where to find tools that you like better :P
 * 
 * This build is heavily focused on being minimalistic. If it's not an action that can be assigned a hotkey that feels comfortable,
 * it's very likely a console command. You can open src/enums/Commands.hx for a full list. Also most key actions will also have a console command.
 * 
 * -Kevy
```


```
===
Building
===
```

Install Haxe, preferably latest

Install the following libraries ``haxelib install [lib name]``

For all targets

``haxelib install heaps``

For HashLink JIT/HashLink C

``haxelib install hlsdl``
``haxelib install hlopenal``

create new file named build.hxml

For targetting JavaScript, add the following parameters:

```
-cp src
-dce full
-main Main
-lib heaps
-js bin/js/openlr.js
```

Targetting Hashlink JIT

```
-cp src
-lib heaps
-lib hlsdl
-lib hlopenal
-hl bin/hl/OpenLR.hl
```

Targetting Hashlink C

```
-cp src
-lib heaps
-lib hlsdl
-lib hlopenal
-hl bin/c/main.c
```

Hashlink VM will be needed to run .hl files. To bundle it with an executable, rename ``OpenLR.hl`` to ``hlboot.dat`` and bundle it with the following files:
	
```
- fmt.hdll
- hl.exe
- libhl.dll
- openal.hdll
- OpenAL32.dll
- sdl.hdll
- SDL2.dll
- ui.hdll
```

The HashLink VM is open source. You can compile it to your platform if so desired.