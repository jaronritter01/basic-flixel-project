package;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class ScreensaverHero extends FlxSprite
{
	public function new(X:Float = 0, Y:Float = 0)
	{
		super(X, Y);
		this.makeGraphic(40, 20, FlxColor.BLUE, false);
	}

	override public function update(elapsed:Float)
	{
		this.setColorTransform(1, 0, 0, 1, 255, 0, 0, 0);
		super.update(elapsed);
	}
}
