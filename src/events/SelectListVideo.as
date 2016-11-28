package events
{
	import flash.events.Event;

	public class SelectListVideo extends Event
	{
		public var eventName:String ;
		public var data:Object;
		
		public function SelectListVideo(eventName:String,data:Object,isBuble:Boolean= true)
		{
			super(eventName, isBuble);
			this.data = data;
		}
		
		public static const PLAY_NEXT_LIST_VIDEO:String = "playNextListVideo";
	}
}