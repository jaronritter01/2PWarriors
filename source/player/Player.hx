package player;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Player extends FlxSprite
{
	static var SPEED:Float = 200;
	static var FRICTION:Float = 1600;
	static var GRAVITY:Float = 500;

	var playerNum:Int;

	public function new(x:Float = 0, y:Float = 0, playerNum:Int = -1)
	{
		super(x, y);
		makeGraphic(16, 16, FlxColor.RED);
		this.playerNum = playerNum;
		drag.x = FRICTION;
		acceleration.y = GRAVITY;
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		updateMovement();
	}

	function updateMovement()
	{
		var up:Bool = false;
		var down:Bool = false;
		var left:Bool = false;
		var right:Bool = false;
		var hit:Bool = false;
		var shoot:Bool = false;

		if (playerNum == 1)
		{
			// this will handle player ones movement and actions
			up = FlxG.keys.justPressed.W;
			down = FlxG.keys.pressed.S;
			left = FlxG.keys.pressed.A;
			right = FlxG.keys.pressed.D;
			hit = FlxG.keys.pressed.V;
			shoot = FlxG.keys.pressed.C;
		}
		else
		{
			// this handles player two's actions and movements
			up = FlxG.keys.justPressed.I;
			down = FlxG.keys.pressed.K;
			left = FlxG.keys.pressed.J;
			right = FlxG.keys.pressed.L;
			hit = FlxG.keys.pressed.B;
			shoot = FlxG.keys.pressed.N;
		}

		// this is used to cancel out the players movements in the opposite direction
		if (left && right)
			left = right = false;

		if (left)
		{
			velocity.x = -SPEED;
		}

		if (right)
		{
			velocity.x = SPEED;
		}

		if (up)
		{
			velocity.y = -300;
		}
	}
}
