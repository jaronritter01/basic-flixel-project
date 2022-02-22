package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var screensaverGroup = new FlxTypedGroup<ScreensaverHero>();
	var wallGroup = new FlxTypedGroup<Wall>();
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

		var helloWorldText = new FlxText(200, 200, -1);
		helloWorldText.text = "Hello World!";
		helloWorldText.setFormat("assets/fonts/AkayaTelivigala-Regular.ttf", 60, FlxColor.BLUE, "center", FlxTextBorderStyle.SHADOW);
		add(helloWorldText);

		scoreText = new FlxText(10, 10);
		scoreText.text = "Score: " + Std.string(score);
		add(scoreText);

		// Added the screen saver stuff
		screensaver = new ScreensaverHero(10, 200);
		screensaver1 = new ScreensaverHero(10, 200);
		screensaver2 = new ScreensaverHero(10, 200);
		screensaver3 = new ScreensaverHero(10, 200);
		screensaver4 = new ScreensaverHero(10, 200);
		screensaverGroup.add(screensaver);
		screensaverGroup.add(screensaver1);
		screensaverGroup.add(screensaver2);
		screensaverGroup.add(screensaver3);
		screensaverGroup.add(screensaver4);
		add(screensaverGroup);

		// added the moveable player
		// change the last parameter to control the speed of the hero
		hero = new ControllableHero(400, 400, 200);
		add(hero);

		// make some walls
		wall1 = new Wall(100, 100);
		wall2 = new Wall(100, 200);
		wall3 = new Wall(100, 300);
		wall4 = new Wall(100, 400);
		wallGroup.add(wall1);
		wallGroup.add(wall2);
		wallGroup.add(wall3);
		wallGroup.add(wall4);
		add(wallGroup);
	}

	public function handleOverlap(hero:ControllableHero, screensaverArg:ScreensaverHero)
	{
		score++;
		scoreText.text = "Score: " + Std.string(score);
	}

	override public function update(elapsed:Float)
	{
		FlxG.collide(hero, wallGroup);
		FlxG.overlap(hero, screensaverGroup, handleOverlap);
		super.update(elapsed);
	}
}
