package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.math.FlxRandom;
import flixel.util.FlxColor;

class ScreensaverHero extends FlxSprite
{
	var randomSeed:FlxRandom;
	var randomX:Int;
	var randomY:Int;

	public function new(X:Float = 0, Y:Float = 0)
	{
		super(X, Y);
		this.makeGraphic(40, 20, FlxColor.BLUE, false);
		var randomSeed:FlxRandom = new FlxRandom();
		randomX = Std.int(randomSeed.int(-100, 100) % 2);
		randomY = Std.int(randomSeed.int(-100, 100) % 2);

		if (randomX == 0 && randomY == 0)
		{
			randomX = randomSeed.sign(50);
			randomY = randomSeed.sign(50);
		}
	}

	override public function update(elapsed:Float)
	{
		var currentPoint:FlxPoint = getScreenPosition();
		this.setColorTransform(randomX, randomY, randomX, 1, Std.int(currentPoint.x % 255), Std.int(currentPoint.y % 255), Std.int(currentPoint.x % 255), 1);
		this.setPosition(currentPoint.x + randomX, currentPoint.y + randomY);

		if (FlxG.keys.pressed.SPACE)
		{
			randomX = randomX * -1;
			randomY = randomY * -1;
		}

		// This handles the screen wrapping
		if (!this.inWorldBounds())
		{
			if (currentPoint.y == 489)
			{
				this.setPosition(currentPoint.x, 0);
			}
			else if (currentPoint.x == 649)
			{
				this.setPosition(0, currentPoint.y);
			}
			else if (currentPoint.x == -49)
			{
				this.setPosition(649, currentPoint.y);
			}
			else if (currentPoint.y == -29)
			{
				this.setPosition(currentPoint.x, 489);
			}
		}
		super.update(elapsed);
	}
}
