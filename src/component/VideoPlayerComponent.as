package component
{
	import mx.controls.SWFLoader;
	import mx.core.INavigatorContent;
	import mx.events.FlexEvent;
	
	import spark.components.Image;
	import spark.components.Label;
	import spark.components.NavigatorContent;
	
	import model.Video;
	
	import net.fproject.di.Injector;

//	[EventHandling(event="mx.events.FlexEvent.CREATION_COMPLETE",handler="swfLoader_creationCompleteHandler")]
	public class VideoPlayerComponent extends NavigatorContent implements INavigatorContent
	{
		[Bindable]
		public var modelVideo:Object;
		
		[Bindable]
		[SkinPart]
		[PropertyBinding(text = "nameToDisplay@")]
		public var test1:Label;
		
		[Bindable]
		[SkinPart]
		[PropertyBinding(text = "describeToDisplay@")]
		public var test2:Label;
		
		[Bindable]
		public var nameToDisplay:String;
		
		[Bindable]
		public var describeToDisplay:String;
		
		[SkinPart(required="true",type="static")]
		[Bindable]
		public var swfLoader:SWFLoader;
		
		[SkinPart(required="true",type="static")]
		public var imageDelete:Image;
		
		public function ChangeVideoPlay(event:FlexEvent):void{
			initApp();
		}
		
		public function swfLoader_creationCompleteHandler(event:FlexEvent):void
		{
			// TODO Auto-generated method stub
			initApp();
			
		}
		
		public function initApp():void{
			loadVideo();
		}
		
		public function loadVideo():void{
			if(modelVideo== null){
				modelVideo = new model.Video("https://www.youtube.com/watch?v=iiw9zGHnANQ","Desing Parten","Design pattern");
			}
			swfLoader.unloadAndStop();
			swfLoader.load("https://www.youtube.com/v/" + modelVideo.id);
			swfLoader.visible = true;
			imageDelete.visible = false;
		}
		
		public function VideoPlayerComponent()
		{
			Injector.inject(this);
		}
	}
}