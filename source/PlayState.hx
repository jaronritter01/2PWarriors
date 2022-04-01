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
		player1 = new Player(20, 20, 1);
		var groundPiece1 = new Ground(0, FlxG.height - 25, 12, 200, FlxColor.WHITE);
		groundPiece1.screenCenter(X);
		var groundPiece2 = new Ground(0, 200, 12, 100, FlxColor.WHITE);
		groundPiece2.screenCenter(X);
		var groundPiece3 = new Ground(0, 0, 12, 80, FlxColor.WHITE);
		var groundPiece4 = new Ground(0, 0, 12, 80, FlxColor.WHITE);
		var groundPiece5 = new Ground(0, 0, 12, 80, FlxColor.WHITE);
		var groundPiece6 = new Ground(0, 0, 12, 80, FlxColor.WHITE);
		groundPieces = new FlxTypedGroup<Ground>();
		groundPieces.add(groundPiece1);
		groundPieces.add(groundPiece2);
		groundPieces.add(groundPiece3);
		groundPieces.add(groundPiece4);
		groundPieces.add(groundPiece5);
		groundPieces.add(groundPiece6);
		add(player1);
		add(groundPieces);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		FlxG.collide(player1, groundPieces);
	}
}
