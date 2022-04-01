import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class EndState extends FlxState
{
	var playAgainButton:FlxButton;
	var playAgainText:FlxText;

	override public function create()
	{
		super.create();
		playAgainButton = new FlxButton(0, 0, "Play Again", clickPlay);
		playAgainButton.screenCenter();

		playAgainText = new FlxText(0, 0, -1, "Play Again?", 20);
		playAgainText.screenCenter();
		playAgainButton.y = playAgainText.y + 40;

		add(playAgainButton);
		add(playAgainText);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	function clickPlay()
	{
		FlxG.switchState(new PlayState());
	}
}
