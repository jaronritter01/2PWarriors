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
	var inAir:Bool;
	var hasGun:Bool;
	var playState:PlayState;

	public function new(x:Float = 0, y:Float = 0, playerNum:Int = -1, color:FlxColor, state:PlayState)
	{
		super(x, y);
		FlxG.mouse.visible = false;
		makeGraphic(16, 16, color);
		this.playerNum = playerNum;
		drag.x = FRICTION;
		acceleration.y = GRAVITY;
		playState = state;
		solid = true;
		inAir = false;
		hasGun = false;
		health = 2;
	}

	override public function update(elapsed:Float)
	{
		updateMovement();
		super.update(elapsed);
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
			hit = FlxG.keys.justPressed.V;
			shoot = FlxG.keys.justPressed.C;
		}
		else
		{
			// this handles player two's actions and movements
			up = FlxG.keys.justPressed.I;
			down = FlxG.keys.pressed.K;
			left = FlxG.keys.pressed.J;
			right = FlxG.keys.pressed.L;
			hit = FlxG.keys.justPressed.B;
			shoot = FlxG.keys.justPressed.N;
		}

		// this is used to cancel out the players movements in the opposite direction
		if (left && right)
			left = right = false;

		if (left)
		{
			facing = LEFT;
			velocity.x = -SPEED;
		}

		if (right)
		{
			facing = RIGHT;
			velocity.x = SPEED;
		}

		if (up && !inAir)
		{
			velocity.y = -355;
			inAir = true;
		}
	}

	public function setOnGround()
	{
		inAir = false;
	}

	public function setHasGun()
	{
		hasGun = true;
	}

	public function getHasGun()
	{
		return hasGun;
	}
}
