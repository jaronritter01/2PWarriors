package pickups;

import player.Player;
import flixel.util.FlxColor;
import flixel.FlxSprite;

class Gun extends FlxSprite
{
	static var GRAVITY:Float = 500;

	public function new(x:Float, y:Float)
	{
		super(x, y);
		makeGraphic(8, 8, FlxColor.GREEN);
		this.acceleration.y = GRAVITY;
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	public static function pickedUp(player:Player, gun:Gun)
	{
		gun.kill();
		player.setHasGun();
	}
}
