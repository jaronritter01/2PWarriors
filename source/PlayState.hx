package;

import pickups.Bullets.Bullet;
import pickups.Gun;
import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.util.FlxColor;
import mapassets.Ground;
import player.Player;

class PlayState extends FlxState
{
	var player1:Player;
	var player2:Player;
	var groundPieces:FlxTypedGroup<Ground>;
	var gun:Gun;
	var bullets:FlxTypedGroup<Bullet>;

	override public function create()
	{
		super.create();
		player1 = new Player(42, 20, 1, FlxColor.RED, this);
		player2 = new Player(FlxG.width - 55, 20, 2, FlxColor.BLUE, this);
		gun = new Gun(FlxG.width / 2, 0);
		createBullets();

		buildMap();
		add(player1);
		add(player2);
		add(groundPieces);
		add(gun);
	}

	override public function update(elapsed:Float)
	{
		FlxG.overlap(player1, groundPieces, handleInAir);
		FlxG.overlap(player2, groundPieces, handleInAir);
		FlxG.collide(groundPieces, gun);
		FlxG.overlap(player1, gun, Gun.pickedUp);
		FlxG.overlap(player2, gun, Gun.pickedUp);
		FlxG.collide(player1, groundPieces);
		FlxG.collide(player2, groundPieces);
		FlxG.collide(player1, player2);
		FlxG.overlap(player1, bullets, handleShot);
		FlxG.overlap(player2, bullets, handleShot);
		shootGun();
		handleRespawn();
		super.update(elapsed);
	}

	public function handleInAir(player:Player, ground:FlxTypedGroup<Ground>)
	{
		player.setOnGround();
	}

	public function buildMap()
	{
		var groundPiece1 = new Ground(0, FlxG.height - 25, 12, 200, FlxColor.WHITE);
		groundPiece1.screenCenter(X);
		var groundPiece2 = new Ground(0, 230, 12, 100, FlxColor.WHITE);
		groundPiece2.screenCenter(X);
		var groundPiece3 = new Ground(35, 185, 12, 80, FlxColor.WHITE);
		var groundPiece4 = new Ground(FlxG.width - 115, 185, 12, 80, FlxColor.WHITE);
		var groundPiece5 = new Ground(50, 340, 12, 80, FlxColor.WHITE);
		var groundPiece6 = new Ground(FlxG.width - 130, 340, 12, 80, FlxColor.WHITE);
		groundPieces = new FlxTypedGroup<Ground>();
		groundPieces.add(groundPiece1);
		groundPieces.add(groundPiece2);
		groundPieces.add(groundPiece3);
		groundPieces.add(groundPiece4);
		groundPieces.add(groundPiece5);
		groundPieces.add(groundPiece6);
	}

	function createBullets()
	{
		// adds the bulelts to the state
		bullets = new FlxTypedGroup<Bullet>();
		for (i in 0...100)
		{
			var bullet = new Bullet(0, 0);
			bullet.kill();
			bullets.add(bullet);
		}
		add(bullets);
	}

	function shootGun()
	{
		if (player1.getHasGun() && FlxG.keys.justPressed.C)
		{
			var newBullet = bullets.recycle();
			newBullet.y = player1.y + 3;
			if (player1.facing == LEFT)
			{
				newBullet.x = player1.x - (player1.width + 10);
				newBullet.velocity.x = -300;
			}
			else
			{
				newBullet.x = player1.x + (player1.width + 10);
				newBullet.velocity.x = 300;
			}
			newBullet.revive();
		}

		if (player2.getHasGun() && FlxG.keys.justPressed.N)
		{
			var newBullet = bullets.recycle();
			newBullet.y = player2.y + 3;
			if (player2.facing == LEFT)
			{
				newBullet.x = player2.x - (player2.width + 10);
				newBullet.velocity.x = -300;
			}
			else
			{
				newBullet.x = player2.x + (player2.width + 10);
				newBullet.velocity.x = 300;
			}
			newBullet.revive();
		}
	}

	public function handleShot(player:Player, bullet:Bullet)
	{
		if (bullet.x < player.x + player.width / 3)
		{
			player.velocity.x += 300;
		}
		else
		{
			player.velocity.x -= 300;
		}
		bullet.kill();
	};

	public function handleRespawn()
	{
		if (!player1.isOnScreen() && player1.health > 0)
		{
			player1.hurt(1);
			player1.reset(42, 20);
		}

		if (!player2.isOnScreen() && player2.health > 0)
		{
			player2.hurt(1);
			player2.reset(FlxG.width - 55, 20);
		}
	}
}
