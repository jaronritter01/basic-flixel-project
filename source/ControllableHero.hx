import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class ControllableHero extends FlxSprite
{
	var speed:Int;

	public function new(X:Int = 0, Y:Int = 0, ?speed:Int = 100)
	{
		super(X, Y);
		this.speed = speed;
		this.makeGraphic(50, 12, FlxColor.WHITE, false);
		drag.x = this.speed * 10;
		drag.y = this.speed * 10;
	}

	function movement()
	{
		final left = FlxG.keys.pressed.LEFT;
		final right = FlxG.keys.pressed.RIGHT;
		final up = FlxG.keys.pressed.UP;
		final down = FlxG.keys.pressed.DOWN;

		// this is where I learned how to use velocity
		if (left)
		{
			velocity.x = -speed;
		}

		if (right)
		{
			velocity.x = speed;
		}

		if (up)
		{
			velocity.y = -speed;
		}

		if (down)
		{
			velocity.y = speed;
		}

		if (down && up)
		{
			velocity.y = 0;
		}

		if (left && right)
		{
			velocity.x = 0;
		}
	}

	override public function update(elapsed:Float)
	{
		movement();
		super.update(elapsed);
	}
}
