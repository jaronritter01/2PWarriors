package mapassets;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Ground extends FlxSprite
{
	public function new(x:Float = 0, y:Float = 0)
	{
		super(x, y);
		immovable = true;
		solid = true;
	}
}
