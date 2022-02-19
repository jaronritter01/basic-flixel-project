package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();
		var ourHero:Hero = new Hero(300, 300, "John");
		add(ourHero);

		var helloWorldText = new FlxText(200, 200, -1);
		helloWorldText.text = "Hello World!";
		helloWorldText.setFormat("assets/fonts/AkayaTelivigala-Regular.ttf", 60, FlxColor.BLUE, "center", FlxTextBorderStyle.SHADOW);
		add(helloWorldText);

		var screensaver = new ScreensaverHero(100, 100);
		add(screensaver);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
