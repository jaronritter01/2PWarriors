package pickups;

import flixel.util.FlxColor;
import flixel.FlxSprite;

class Bullet extends FlxSprite
{
	public function new(x:Float, y:Float)
	{
		super(x, y);
		makeGraphic(3, 5, FlxColor.ORANGE);
	}

	override public function update(elapsed:Float)
	{
		if (!isOnScreen())
		{
			kill();
		}
		super.update(elapsed);
	}
}
