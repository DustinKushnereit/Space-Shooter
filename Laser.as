package
{	import flash.display.MovieClip;	import flash.events.*;		public class Laser extends MovieClip
	{		private var _root:Object;				public function Laser()
		{			addEventListener(Event.ADDED, beginClass);			addEventListener(Event.ENTER_FRAME, eFrame);		}				private function beginClass(event:Event)
		{			_root = MovieClip(root);		}				private function eFrame(event:Event)
		{					}
		
		public function removeListeners()
		{
			removeEventListener(Event.ENTER_FRAME, eFrame);
		}	}}