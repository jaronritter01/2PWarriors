package player;

import flixel.util.FlxTimer;
import flixel.system.FlxSound;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class Player extends FlxSprite
{
	public static var SPEED:Float = 200;
	static var FRICTION:Float = 1600;
	static var GRAVITY:Float = 500;

	var playerNum:Int;
	var inAir:Bool;
	var hasGun:Bool;
	var playState:PlayState;
	var lives:FlxTypedGroup<FlxSprite>;
	var jumpNoise:FlxSound;

	public var isStunned:Bool;
	public var up:Bool;
	public var down:Bool;
	public var left:Bool;
	public var right:Bool;

	public function new(x:Float = 0, y:Float = 0, playerNum:Int = -1, color:FlxColor, state:PlayState)
	{
		super(x, y);
		jumpNoise = FlxG.sound.load(AssetPaths.Jump__wav, 1, false);
		lives = new FlxTypedGroup<FlxSprite>();
		makeGraphic(16, 16, color);
		this.playerNum = playerNum;
		drag.x = FRICTION;
		acceleration.y = GRAVITY;
		playState = state;
		solid = true;
		inAir = false;
		hasGun = false;
		health = 3;
		isStunned = false;
	}

	override public function update(elapsed:Float)
	{
		updateMovement();
		super.update(elapsed);
	}

	function updateMovement()
	{
		up = false;
		down = false;
		left = false;
		right = false;

		// cant move if stunned
		if (!isStunned)
		{
			if (playerNum == 1)
			{
				// this will handle player ones movement and actions
				up = FlxG.keys.justPressed.W;
				down = FlxG.keys.pressed.S;
				left = FlxG.keys.pressed.A;
				right = FlxG.keys.pressed.D;
			}
			else
			{
				// this handles player two's actions and movements
				up = FlxG.keys.justPressed.I;
				down = FlxG.keys.pressed.K;
				left = FlxG.keys.pressed.J;
				right = FlxG.keys.pressed.L;
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
				jumpNoise.play();
				velocity.y = -355;
				inAir = true;
			}
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

	public function setLostGun()
	{
		hasGun = false;
	}

	public function getHasGun()
	{
		return hasGun;
	}

	public function stun()
	{
		isStunned = true;
	}

	public function removeStun()
	{
		isStunned = false;
	}
}
