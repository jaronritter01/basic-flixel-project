package;

import flixel.FlxState;

class PlayState extends FlxState
{
	override public function create()
	{
		super.create();
		var ourHero:Hero = new Hero(300, 275, "John");
		add(ourHero);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
