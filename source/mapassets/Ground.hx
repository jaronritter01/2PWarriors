package mapassets;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Ground extends FlxSprite
{
	public function new(x:Float = 0, y:Float = 0, height:Int = 0, width:Int = 0, color:FlxColor)
	{
		super(x, y);
		makeGraphic(width, height, color);
		immovable = true;
		solid = true;
	}
}
