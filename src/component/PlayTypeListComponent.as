package component
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayList;
	import mx.controls.SWFLoader;
	import mx.core.INavigatorContent;
	import mx.events.FlexEvent;
	
	import spark.components.Button;
	import spark.components.Image;
	import spark.components.Label;
	import spark.components.List;
	
	import abstract.NavinatorView;
	
	import model.Video;
	
	import net.fproject.di.Injector;
	
	import util.PlayListModel;

	public class PlayTypeListComponent extends NavinatorView implements INavigatorContent
	{
		[Bindable]
		public var modelVideoList:PlayListModel;
		
		[SkinPart(required="true",type="static")]
		[Bindable]
		[PropertyBinding(modelVideo="modelVideoList.currentPlay@")]
		[PropertyBinding(nameToDisplay="{Name to display}")]
		[PropertyBinding(describeToDisplay="{Describe}")]
		public var videoPlayerComponent:VideoPlayerComponent;
		
		[Bindable]
		[SkinPart]
		[PropertyBinding(dataProvider = "modelVideoList.listVideo@")]
		[EventHandling(event="change",handler="listReferenceVideo_change")]
		public var listReferenceVideo:List;
	
		
		
		public function listReferenceVideo_change(event:Event):void
		{
			modelVideoList.currentPlay = listReferenceVideo.selectedItem as Video;
			videoPlayerComponent.loadVideo();
		}
		
		
		[Bindable]
		[SkinPart(required="true",type="static")]
		[EventHandling(event="click",handler="changeVideo_click")]
		public var nextVideo:Button;
		
		[Bindable]
		[SkinPart(required="true",type="static")]
		[EventHandling(event="click",handler="changeVideo_click")]
		public var prevVideo:Button;
		
		public var currentIndex:int;
		
		public function updateDerectButton():void
		{
			prevVideo.enabled = (currentIndex > 0) ;
			nextVideo.enabled = (currentIndex < modelVideoList.listVideo.length -1);
		}
		
		public function changeVideo_click(event:MouseEvent):void
		{
			currentIndex = modelVideoList.listVideo.getItemIndex(modelVideoList.currentPlay);
			if(event.currentTarget == prevVideo){
				currentIndex--;
			} else {
				currentIndex++;
			}
			modelVideoList.currentPlay = model.Video(modelVideoList.listVideo.getItemAt(currentIndex));
			updateDerectButton();
			videoPlayerComponent.loadVideo();
		}
		
		public function PlayTypeListComponent()
		{
			Injector.inject(this);
		}
	}
}