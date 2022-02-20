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
		var screensaver1 = new ScreensaverHero(100, 100);
		add(screensaver1);
		var screensaver2 = new ScreensaverHero(100, 100);
		add(screensaver2);
		var screensaver3 = new ScreensaverHero(100, 100);
		add(screensaver3);
		var screensaver4 = new ScreensaverHero(100, 100);
		add(screensaver4);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
