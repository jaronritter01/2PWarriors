package;

import flixel.tweens.motion.QuadMotion;
import flixel.util.FlxTimer;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.FlxSprite;
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
	var player1Lives:FlxTypedGroup<FlxSprite>;
	var player2:Player;
	var player2Lives:FlxTypedGroup<FlxSprite>;
	var groundPieces:FlxTypedGroup<Ground>;
	var gun:Gun;
	var bullets:FlxTypedGroup<Bullet>;
	var background:FlxSprite;
	var gunshotNoise:FlxSound;
	var deathNoise:FlxSound;
	var hitNoise:FlxSound;
	var player1Timer:FlxTimer;
	var player2Timer:FlxTimer;

	override public function create()
	{
		super.create();
		FlxG.sound.playMusic(AssetPaths.BeepBox_Song__wav, .6, true);
		player1Timer = new FlxTimer();
		player1Timer.loops = 1;
		player2Timer = new FlxTimer();
		player2Timer.loops = 1;
		gunshotNoise = FlxG.sound.load(AssetPaths.shot__wav, 1, false);
		deathNoise = FlxG.sound.load(AssetPaths.death__wav, .7, false);
		hitNoise = FlxG.sound.load(AssetPaths.Hit_Hurt__wav, .7, false);
		background = new FlxSprite();
		background.loadGraphic(AssetPaths.backgroundBig__png, false, FlxG.width, FlxG.height);
		add(background);
		FlxG.mouse.visible = false;
		player1 = new Player(42, 20, 1, FlxColor.RED, this);
		// player1.loadGraphic(AssetPaths.bluepixelknightwalking__png, false, 60, 30);
		player1.loadGraphic(AssetPaths.knight1animation__png, true, 36, 30);
		player1.setFacingFlip(LEFT, true, false);
		player1.setFacingFlip(RIGHT, false, false);
		player1.animation.add("idle", [0, 1, 2, 3, 4], 12, true);
		player1.animation.add("walking", [5, 6, 7, 8, 9, 10, 11, 12], 12, true);
		player1.animation.add("jump", [5], 12, false);
		player1.animation.add("hit", [13, 14, 15, 16, 17, 18], 12, true);

		player2 = new Player(FlxG.width - 55, 20, 2, FlxColor.BLUE, this);
		player2.flipX = true;
		player2.loadGraphic(AssetPaths.knight1animation__png, true, 36, 30);
		player2.setFacingFlip(LEFT, true, false);
		player2.setFacingFlip(RIGHT, false, false);
		player2.animation.add("idle", [0, 1, 2, 3, 4], 12, true);
		player2.animation.add("walking", [5, 6, 7, 8, 9, 10, 11, 12], 12, true);
		player2.animation.add("jump", [5], 12, false);
		player2.animation.add("hit", [13, 14, 15, 16, 17, 18], 12, true);

		gun = new Gun(FlxG.width / 2, 0);
		gun.loadGraphic(AssetPaths.gunbase__png, false, 20, 10);
		createBullets();

		buildMap();
		createLives();
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
		melee();
		handleRespawn();
		goToDeathScreen();
		super.update(elapsed);
	}

	public function unStun(timer:FlxTimer)
	{
		if (player1.isStunned)
		{
			player1.removeStun();
		}

		if (player2.isStunned)
		{
			player2.removeStun();
		}
	}

	public function goToDeathScreen()
	{
		if (player1.health <= 0)
		{
			var winText = new FlxText(0, 0, -1, "Player2 Wins!", 30);
			winText.screenCenter();
			add(winText);

			var timer = haxe.Timer.delay(function()
			{
				FlxG.sound.music.stop();
				FlxG.mouse.visible = true;
			}, 5000);
		}

		if (player2.health <= 0)
		{
			var winText = new FlxText(0, 0, -1, "Player1 Wins!", 30);
			winText.screenCenter();
			add(winText);

			var timer = haxe.Timer.delay(function()
			{
				FlxG.sound.music.stop();
				FlxG.mouse.visible = true;
				FlxG.switchState(new EndState());
			}, 5000);
		}
	}

	public function melee()
	{
		// player one rightside melee
		if ((player2.x - 8 < player1.x + (player1.width - 1))
			&& player1.x + (player1.width - 1) < player2.x
				&& player1.facing == RIGHT
				&& (player1.y - player2.y > -10 && player1.y - player2.y < 10)
				&& FlxG.keys.justPressed.X)
		{
			player1.animation.play("hit");
			hitNoise.play();
			player2.stun();

			player2Timer.start(.7, unStun, 1);

			player2.velocity.x = 250;
			if (player2.getHasGun())
			{
				respawnGun();
			}
		}

		// player 2 right side melee
		if ((player1.x - 8 < player2.x + (player2.width - 1))
			&& player2.x + (player2.width - 1) < player1.x
				&& player2.facing == RIGHT
				&& (player2.y - player1.y > -10 && player2.y - player1.y < 10)
				&& FlxG.keys.justPressed.M)
		{
			player2.animation.play("hit");
			hitNoise.play();
			player1.stun();
			player1Timer.start(.7, unStun, 1);
			player1.velocity.x = 250;
			if (player1.getHasGun())
			{
				respawnGun();
			}
		}

		// player 1 leftside melee
		if ((player1.x - 8 < player2.x + (player2.width - 1))
			&& player2.x + (player2.width - 1) < player1.x
				&& player1.facing == LEFT
				&& (player2.y - player1.y > -10 && player2.y - player1.y < 10)
				&& FlxG.keys.justPressed.X)
		{
			player1.animation.play("hit");
			hitNoise.play();
			player2.stun();
			player2Timer.start(.7, unStun, 1);
			player2.velocity.x = -250;
			if (player2.getHasGun())
			{
				respawnGun();
			}
		}

		// player 2 left side melee
		if ((player2.x - 8 < player1.x + (player1.width - 1))
			&& player1.x + (player1.width - 1) < player2.x
				&& player2.facing == LEFT
				&& (player1.y - player2.y > -10 && player1.y - player2.y < 10)
				&& FlxG.keys.justPressed.M)
		{
			player2.animation.play("hit");
			hitNoise.play();
			player1.stun();
			player1Timer.start(.7, unStun, 1);
			player1.velocity.x = -250;
			if (player1.getHasGun())
			{
				respawnGun();
			}
		}
	}

	public function createLives()
	{
		player1Lives = new FlxTypedGroup<FlxSprite>();
		var sprite = new FlxSprite(20, 20, AssetPaths.lives__png);
		var sprite1 = new FlxSprite(40, 20, AssetPaths.lives__png);
		var sprite2 = new FlxSprite(60, 20, AssetPaths.lives__png);
		player1Lives.add(sprite2);
		player1Lives.add(sprite1);
		player1Lives.add(sprite);

		player2Lives = new FlxTypedGroup<FlxSprite>();
		var sprite3 = new FlxSprite(FlxG.width - 60, 20, AssetPaths.lives__png);
		var sprite4 = new FlxSprite(FlxG.width - 40, 20, AssetPaths.lives__png);
		var sprite5 = new FlxSprite(FlxG.width - 20, 20, AssetPaths.lives__png);
		player2Lives.add(sprite3);
		player2Lives.add(sprite4);
		player2Lives.add(sprite5);

		add(player1Lives);
		add(player2Lives);
	}

	public function handleInAir(player:Player, ground:FlxTypedGroup<Ground>)
	{
		player.setOnGround();
	}

	public function buildMap()
	{
		var groundPiece1 = new Ground(0, FlxG.height - 25);
		groundPiece1.loadGraphic(AssetPaths.ground200x20__png, false, 200, 20);
		groundPiece1.screenCenter(X);
		var groundPiece2 = new Ground(0, 230);
		groundPiece2.loadGraphic(AssetPaths.ground100x20__png, false, 100, 20);
		groundPiece2.screenCenter(X);
		var groundPiece3 = new Ground(35, 185);
		groundPiece3.loadGraphic(AssetPaths.ground80x20__png, false, 80, 20);
		var groundPiece4 = new Ground(FlxG.width - 115, 185);
		groundPiece4.loadGraphic(AssetPaths.ground80x20__png, false, 80, 20);
		var groundPiece5 = new Ground(50, 340);
		groundPiece5.loadGraphic(AssetPaths.ground80x20__png, false, 80, 20);
		var groundPiece6 = new Ground(FlxG.width - 130, 340);
		groundPiece6.loadGraphic(AssetPaths.ground80x20__png, false, 80, 20);
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
		final BULLETSPEED = 500;
		if (player1.getHasGun() && FlxG.keys.justPressed.C)
		{
			gunshotNoise.play();
			var newBullet = bullets.recycle();
			newBullet.y = player1.y + 3;
			if (player1.facing == LEFT)
			{
				newBullet.x = player1.x - 7;
				newBullet.velocity.x = -BULLETSPEED;
			}
			else
			{
				newBullet.x = player1.x + (player1.width + 4);
				newBullet.velocity.x = BULLETSPEED;
			}
			newBullet.revive();
		}

		if (player2.getHasGun() && FlxG.keys.justPressed.N)
		{
			gunshotNoise.play();
			var newBullet = bullets.recycle();
			newBullet.y = player2.y + 12;
			if (player2.facing == LEFT)
			{
				newBullet.x = player2.x - 7;
				newBullet.velocity.x = -BULLETSPEED;
			}
			else
			{
				newBullet.x = player2.x + (player2.width + 4);
				newBullet.velocity.x = BULLETSPEED;
			}
			newBullet.revive();
		}
	}

	public function handleShot(player:Player, bullet:Bullet)
	{
		hitNoise.play();
		if (bullet.x < player.x + player.width / 3)
		{
			player.stun();
			player.velocity.x = 300;
		}
		else
		{
			player.stun();
			player.velocity.x = -300;
		}
		if (player1.isStunned)
		{
			player1Timer.start(.7, unStun, 1);
		}

		if (player2.isStunned)
		{
			player2Timer.start(.7, unStun, 1);
		}
		bullet.kill();
	};

	public function handleRespawn()
	{
		if (!player1.isOnScreen() && player1.health > 0)
		{
			deathNoise.play();
			player1.hurt(1);
			var life = player1Lives.getFirstAlive();
			life.kill();
			respawnGun();
			player1.reset(42, 20);
		}

		if (!player1.isOnScreen() && player2.health > 0)
		{
			player1.reset(FlxG.width - 55, 20);
		}

		if (!player2.isOnScreen() && player2.health > 0)
		{
			deathNoise.play();
			player2.hurt(1);
			var life = player2Lives.getFirstAlive();
			life.kill();
			respawnGun();
		}

		if (!player2.isOnScreen() && player2.health > 0)
		{
			player2.reset(FlxG.width - 55, 20);
		}
	}

	public function respawnGun()
	{
		for (i in 0...100)
		{
			var bullet = bullets.getFirstAlive();
			if (bullet != null)
			{
				bullet.kill();
			}
		}
		player1.setLostGun();
		player2.setLostGun();
		gun.reset(gun.x, 0);
		gun.revive();
	}
}
