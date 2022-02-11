package;

import flixel.FlxSprite;

class Hero extends FlxSprite
{
	var name:String;

	public function new(X:Float = 0, Y:Float = 0, ?name:String)
	{
		super(X, Y);
		this.name = name;
	}
}
