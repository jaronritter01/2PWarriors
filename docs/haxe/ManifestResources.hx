package;


import haxe.io.Bytes;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

		}

		if (rootPath == null) {

			#if (ios || tvos || emscripten)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif console
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		#if kha

		null
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("null", library);

		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("null");

		#else

		data = '{"name":null,"assets":"aoy4:pathy34:assets%2Fdata%2Fdata-goes-here.txty4:sizezy4:typey4:TEXTy2:idR1y7:preloadtgoR0y24:assets%2Fimages%2F1.webpR2i4290R3y5:IMAGER5R7R6tgoR0y32:assets%2Fimages%2Fbackground.pngR2i35554R3R8R5R9R6tgoR0y35:assets%2Fimages%2FbackgroundBig.pngR2i215265R3R8R5R10R6tgoR0y37:assets%2Fimages%2Fbluepixelknight.pngR2i2827R3R8R5R11R6tgoR0y44:assets%2Fimages%2Fbluepixelknightmidwalk.pngR2i2063R3R8R5R12R6tgoR0y44:assets%2Fimages%2Fbluepixelknightwalking.pngR2i2082R3R8R5R13R6tgoR0y34:assets%2Fimages%2Fground100x20.pngR2i858R3R8R5R14R6tgoR0y34:assets%2Fimages%2Fground200x20.pngR2i1233R3R8R5R15R6tgoR0y33:assets%2Fimages%2Fground80x20.pngR2i783R3R8R5R16R6tgoR0y29:assets%2Fimages%2Fgunbase.pngR2i192R3R8R5R17R6tgoR0y30:assets%2Fimages%2Fgunshoot.pngR2i213R3R8R5R18R6tgoR0y27:assets%2Fimages%2Flives.pngR2i984R3R8R5R19R6tgoR0y33:assets%2Fimages%2Fpixelnights.pngR2i25203R3R8R5R20R6tgoR0y36:assets%2Fimages%2Fredpixelknight.pngR2i2427R3R8R5R21R6tgoR0y43:assets%2Fimages%2Fredpixelknightmidwalk.pngR2i1698R3R8R5R22R6tgoR0y44:assets%2Fimages%2Fredpixelknightstanding.pngR2i2078R3R8R5R23R6tgoR2i9830444R3y5:SOUNDR5y33:assets%2Fmusic%2FBeepBox-Song.wavy9:pathGroupaR25hR6tgoR2i206460R3R24R5y27:assets%2Fsounds%2Fdeath.wavR26aR27hR6tgoR2i19046R3R24R5y30:assets%2Fsounds%2FHit_Hurt.wavR26aR28hR6tgoR2i15102R3R24R5y26:assets%2Fsounds%2FJump.wavR26aR29hR6tgoR2i20336R3R24R5y26:assets%2Fsounds%2Fshot.wavR26aR30hR6tgoR2i2114R3y5:MUSICR5y26:flixel%2Fsounds%2Fbeep.mp3R26aR32y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i39706R3R31R5y28:flixel%2Fsounds%2Fflixel.mp3R26aR34y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i5794R3R24R5R33R26aR32R33hgoR2i33629R3R24R5R35R26aR34R35hgoR2i15744R3y4:FONTy9:classNamey35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R36R37y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i519R3R8R5R42R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i3280R3R8R5R43R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

		#end

	}


}


#if kha

null

#else

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_1_webp extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_background_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_backgroundbig_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bluepixelknight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bluepixelknightmidwalk_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_bluepixelknightwalking_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ground100x20_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ground200x20_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_ground80x20_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_gunbase_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_gunshoot_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_lives_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_pixelnights_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_redpixelknight_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_redpixelknightmidwalk_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_redpixelknightstanding_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_beepbox_song_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_death_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_hit_hurt_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_jump_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_shot_wav extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


#elseif (desktop || cpp)

@:keep @:file("assets/data/data-goes-here.txt") @:noCompletion #if display private #end class __ASSET__assets_data_data_goes_here_txt extends haxe.io.Bytes {}
@:keep @:image("assets/images/1.webp") @:noCompletion #if display private #end class __ASSET__assets_images_1_webp extends lime.graphics.Image {}
@:keep @:image("assets/images/background.png") @:noCompletion #if display private #end class __ASSET__assets_images_background_png extends lime.graphics.Image {}
@:keep @:image("assets/images/backgroundBig.png") @:noCompletion #if display private #end class __ASSET__assets_images_backgroundbig_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bluepixelknight.png") @:noCompletion #if display private #end class __ASSET__assets_images_bluepixelknight_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bluepixelknightmidwalk.png") @:noCompletion #if display private #end class __ASSET__assets_images_bluepixelknightmidwalk_png extends lime.graphics.Image {}
@:keep @:image("assets/images/bluepixelknightwalking.png") @:noCompletion #if display private #end class __ASSET__assets_images_bluepixelknightwalking_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ground100x20.png") @:noCompletion #if display private #end class __ASSET__assets_images_ground100x20_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ground200x20.png") @:noCompletion #if display private #end class __ASSET__assets_images_ground200x20_png extends lime.graphics.Image {}
@:keep @:image("assets/images/ground80x20.png") @:noCompletion #if display private #end class __ASSET__assets_images_ground80x20_png extends lime.graphics.Image {}
@:keep @:image("assets/images/gunbase.png") @:noCompletion #if display private #end class __ASSET__assets_images_gunbase_png extends lime.graphics.Image {}
@:keep @:image("assets/images/gunshoot.png") @:noCompletion #if display private #end class __ASSET__assets_images_gunshoot_png extends lime.graphics.Image {}
@:keep @:image("assets/images/lives.png") @:noCompletion #if display private #end class __ASSET__assets_images_lives_png extends lime.graphics.Image {}
@:keep @:image("assets/images/pixelnights.png") @:noCompletion #if display private #end class __ASSET__assets_images_pixelnights_png extends lime.graphics.Image {}
@:keep @:image("assets/images/redpixelknight.png") @:noCompletion #if display private #end class __ASSET__assets_images_redpixelknight_png extends lime.graphics.Image {}
@:keep @:image("assets/images/redpixelknightmidwalk.png") @:noCompletion #if display private #end class __ASSET__assets_images_redpixelknightmidwalk_png extends lime.graphics.Image {}
@:keep @:image("assets/images/redpixelknightstanding.png") @:noCompletion #if display private #end class __ASSET__assets_images_redpixelknightstanding_png extends lime.graphics.Image {}
@:keep @:file("assets/music/BeepBox-Song.wav") @:noCompletion #if display private #end class __ASSET__assets_music_beepbox_song_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/death.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_death_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Hit_Hurt.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_hit_hurt_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/Jump.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_jump_wav extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/shot.wav") @:noCompletion #if display private #end class __ASSET__assets_sounds_shot_wav extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("C:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("C:/HaxeToolkit/haxe/lib/flixel/4,11,0/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end
