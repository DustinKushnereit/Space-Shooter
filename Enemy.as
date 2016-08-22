package
{
	import flash.display.MovieClip;
	import flash.events.*;
	public class Enemy extends MovieClip
	{
		private var _root:Object;
		public var speed:int = 5;
		
		public function Enemy()
		{
			addEventListener(Event.ADDED, beginClass);
			addEventListener(Event.ENTER_FRAME, eFrame);
		}
		
		private function beginClass(event:Event)
		{
			_root = MovieClip(root);
		}
		
		private function eFrame(event:Event)
		{
			y += speed;
			
			if( _root.score >= 10 )
				speed = 8;
			
			if( _root.score >= 20 )
				speed = 11;
			
			if(this.y >= 790)
			{
				removeEventListener(Event.ENTER_FRAME, eFrame);
				_root.removeChild(this);
				_root.escaped += 1;
			}
			
			for(var i:int = 0; i < _root.laserHolder.numChildren; i++)
			{
				var laserTarget:MovieClip = _root.laserHolder.getChildAt(i);
				
				if( hitTestObject(laserTarget) )
				{
					removeEventListener(Event.ENTER_FRAME, eFrame);
					_root.removeChild(this);
					_root.laserHolder.removeChild(laserTarget);
					laserTarget.removeListeners();
					_root.score += 1;
				}
			}
			
			if(hitTestObject(_root.ship))
			{
				_root.hitEnemy = true;
			}
			
			if(_root.hitEnemy)
			{
				this.parent.removeChild(this);
				removeEventListener(Event.ENTER_FRAME, eFrame);
			}
			
			if(_root.score >= 50)
			{
				_root.hitEnemy = true;
			}
			
			if(_root.escaped >= 10)
			{
				_root.hitEnemy = true;
			}
			
		}
		
		public function removeListeners()
		{
			this.removeEventListener(Event.ENTER_FRAME, eFrame);
		}
		
	}
}