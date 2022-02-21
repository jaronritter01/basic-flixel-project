package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var hero:ControllableHero;
	var wall1:Wall;
	var wall2:Wall;
	var wall3:Wall;
	var wall4:Wall;
	var screensaver:ScreensaverHero;
	var screensaver1:ScreensaverHero;
	var screensaver2:ScreensaverHero;
	var screensaver3:ScreensaverHero;
	var screensaver4:ScreensaverHero;
	var score:Int = 0;
	var scoreText:FlxText;

	override public function create()
	{
		super.create();
		/* var ourHero:Hero = new Hero(300, 300, "John");
			add(ourHero); */

		var helloWorldText = new FlxText(200, 200, -1);
		helloWorldText.text = "Hello World!";
		helloWorldText.setFormat("assets/fonts/AkayaTelivigala-Regular.ttf", 60, FlxColor.BLUE, "center", FlxTextBorderStyle.SHADOW);
		add(helloWorldText);

		scoreText = new FlxText(10, 10);
		scoreText.text = "Score: " + Std.string(score);
		add(scoreText);

		// Added the screen saver stuff
		screensaver = new ScreensaverHero(10, 200);
		add(screensaver);
		screensaver1 = new ScreensaverHero(10, 200);
		add(screensaver1);
		screensaver2 = new ScreensaverHero(10, 200);
		add(screensaver2);
		screensaver3 = new ScreensaverHero(10, 200);
		add(screensaver3);
		screensaver4 = new ScreensaverHero(10, 200);
		add(screensaver4);

		// added the moveable player
		// change the last parameter to control the speed of the hero
		hero = new ControllableHero(400, 400, 200);
		add(hero);

		// make some walls
		wall1 = new Wall(100, 100);
		add(wall1);
		wall2 = new Wall(100, 200);
		add(wall2);
		wall3 = new Wall(100, 300);
		add(wall3);
		wall4 = new Wall(100, 400);
		add(wall4);
	}

	public function handleOverlap(hero:ControllableHero, screensaverArg:ScreensaverHero)
	{
		// this is probabaly not done right so if there is a better way to do this, let me know
		score++;
		scoreText.destroy();
		scoreText = new FlxText(10, 10);
		scoreText.text = "Score: " + Std.string(score);
		add(scoreText);
	}

	override public function update(elapsed:Float)
	{
		FlxG.collide(hero, wall1);
		FlxG.collide(hero, wall2);
		FlxG.collide(hero, wall3);
		FlxG.collide(hero, wall4);
		FlxG.overlap(hero, screensaver, handleOverlap);
		FlxG.overlap(hero, screensaver1, handleOverlap);
		FlxG.overlap(hero, screensaver2, handleOverlap);
		FlxG.overlap(hero, screensaver3, handleOverlap);
		FlxG.overlap(hero, screensaver4, handleOverlap);
		super.update(elapsed);
	}
}
