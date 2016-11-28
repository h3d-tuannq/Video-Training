package events
{
	import flash.events.Event;
	
	import model.Video;

	public class PlayEvent extends Event
	{
		public static const ACTION_PLAY_NEXT:String  = "playNext";
		public static const ACTION_VIEW_ALLVIDEO:String  = "allVideo";
		public static const TV_VIEW_SUBMITTED:String = "tvViewSubmitted";
		public static const PLAY_NEXT_LIST_VIDEO = "playNextListVideo";
		
		
		public var action:String;
		public var video:Video;
		
		
		public function PlayEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}