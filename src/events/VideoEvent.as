package events
{
	import flash.events.Event;
	
	import model.Video;

	public class VideoEvent extends Event
	{
		public static const FIRST_VIEW :String = "firstview";
		public static const EDIT_VIEW:String = "editVideo";
		public static const DELETE_VIEW:String = "deleteVideo";
		public static const UPLOAD_VIEW:String = "uploadVideo";
		
		public var action:String;
		public var data:Video;
		
		public function VideoEvent(type:String, data:Video,action:String=null){
			super(type);
			this.data = data;
			this.action = action;
		}
	}
}