package;

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

	override public function create()
	{
		super.create();
		player1 = new Player(42, 20, 1, FlxColor.RED);
		player2 = new Player(FlxG.width - 55, 20, 2, FlxColor.BLUE);

		buildMap();
		add(player1);
		add(player2);
		add(groundPieces);
	}

	override public function update(elapsed:Float)
	{
		FlxG.overlap(player1, groundPieces, handleInAir);
		FlxG.overlap(player2, groundPieces, handleInAir);
		FlxG.collide(player1, groundPieces);
		FlxG.collide(player2, groundPieces);
		FlxG.collide(player1, player2);
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
}
