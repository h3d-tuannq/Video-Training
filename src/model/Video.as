package model
{
	public class Video
	{
		[Bindable]
		public var url:String;
		[Bindable]
		public var id:String;
		[Bindable]
		public var imageURL:String;
		[Bindable]
		public var nameType:String;
		[Bindable]
		public var name:String;
		[Bindable]
		public var des:String;
		
		public static const TYPE_FLEX:String = "Flex";
		public static const TYPE_DESIGN_PATTERN:String = "Design Pattern";
		public static const TYPE_PROJECTKIT_TRAINING:String = "ProjectKit Training";
		
		public function Video(url:String=null,nameType:String = null, name:String=null, des:String = null ){
			if(url !=null){
				this.url = url;
				this.id = url.split("watch?v=")[url.split("watch?v=").length -1];
				this.imageURL = "http://img.youtube.com/vi/"+this.id+"/1.jpg";
				this.name = name;
				this.des = des;
				this.nameType = nameType;
			}
			
		}
		
	}
}