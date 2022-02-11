package;

import flixel.FlxState;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();
		var ourHero:Hero = new Hero(300, 300, "John");
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
