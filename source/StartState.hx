import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class StartState extends FlxState
{
	var startButton:FlxButton;
	var welcomeText:FlxText;

	override public function create()
	{
		super.create();
		startButton = new FlxButton(0, 0, "Play", clickPlay);
		startButton.screenCenter();

		welcomeText = new FlxText(0, 0, -1, "Welcome To 2PWarriors", 30);
		welcomeText.screenCenter();
		welcomeText.y = welcomeText.y - 50;

		add(welcomeText);
		add(startButton);
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
