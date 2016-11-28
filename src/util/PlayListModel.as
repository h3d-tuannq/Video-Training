package util
{
	import mx.collections.ArrayList;
	
	import model.Video;

	public class PlayListModel
	{
		[Bindable]
		public var currentPlay:Video;
		
		private var _title:String;

		[Bindable]
		public function get title():String{
			return _title;
		}
		
		public function set title(value:String):void{
			_title = value;
		}
		
		private var _description:String;
		
		[Bindable]
		public function get description():String{
			return _description;
		}
		
		public function set description(value:String):void{
			_description = value;
		}
		
		
		private var _listVideo:ArrayList;
		
		[Bindable]
		public function get listVideo():ArrayList{
			return _listVideo;
		}
		
		public function set listVideo(value:ArrayList):void{
			_listVideo= value;
			currentPlay = new model.Video();
			if(_listVideo.length > 0)
				currentPlay = model.Video(_listVideo.getItemAt(0));
		}
		
		public function PlayListModel()
		{
		}
	}
}