import flixel.FlxSprite;
import flixel.util.FlxColor;

class Wall extends FlxSprite
{
	public function new(X:Int = 0, Y:Int = 0)
	{
		super(X, Y);
		this.makeGraphic(15, 50, FlxColor.RED, false);
		immovable = true;
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
