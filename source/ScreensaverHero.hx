package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.math.FlxRandom;
import flixel.util.FlxColor;

class ScreensaverHero extends FlxSprite
{
	var xDirectionIndicator:Int;
	var yDirectionIndicator:Int;

	public function new(X:Float = 0, Y:Float = 0)
	{
		super(X, Y);
		this.makeGraphic(40, 20, FlxColor.BLUE, false);
		xDirectionIndicator = Std.int(FlxG.random.int(-1, 1));
		yDirectionIndicator = Std.int(FlxG.random.int(-1, 1));

		if (xDirectionIndicator == 0 && yDirectionIndicator == 0)
		{
			// now using awesome built in number generator!
			xDirectionIndicator = FlxG.random.sign(50);
			yDirectionIndicator = FlxG.random.sign(50);
		}
	}

	function screenWrapping()
	{
		if (y == FlxG.height + this.height)
		{
			this.setPosition(x, 1 - this.height);
		}
		else if (x == FlxG.width + this.width)
		{
			this.setPosition(1 - this.width, y);
		}
		else if (x == 0 - this.width)
		{
			this.setPosition((FlxG.width + this.width) - 1, y);
		}
		else if (y == 0 - this.height)
		{
			this.setPosition(x, (FlxG.height + this.height) - 1);
		}
	}

	function spacePressedHandling()
	{
		if (FlxG.keys.justPressed.SPACE)
		{
			xDirectionIndicator = -xDirectionIndicator;
			yDirectionIndicator = -yDirectionIndicator;
		}
	}

	override public function update(elapsed:Float)
	{
		this.setColorTransform(xDirectionIndicator, yDirectionIndicator, xDirectionIndicator, 1, Std.int(x % 255), Std.int(y % 255), Std.int(x % 255), 1);
		this.setPosition(x + xDirectionIndicator, y + yDirectionIndicator);

		spacePressedHandling();

		// This handles the screen wrapping
		screenWrapping();

		super.update(elapsed);
	}
}
