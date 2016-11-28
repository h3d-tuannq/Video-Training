package views
{
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayList;
	import mx.core.INavigatorContent;
	
	import spark.components.Button;
	import spark.components.List;
	
	import abstract.NavinatorView;
	
	import component.VideoPlayerComponent;
	
	import model.Video;
	
	import util.PlayListModel;
	
	public class VideoPlayerView extends NavinatorView implements INavigatorContent
	{
		[Bindable]
		public var videoPlay:Video;
		
		[Bindable]
		public var referenceList:ArrayList;
		
		[Bindable]
		public var modelAll:PlayListModel;
		
		/*[Bindable]
		[PropertyBinding(movie="videoPlay@")]
		public var videoPlayer:VideoItemGenderRenderer;*/
		
	/*	[PropertyBinding(nameToDisplay="{Tuannq}")]
		[PropertyBinding(describeToDisplay="{Tuannq}")]
		*/
		[SkinPart]
		[Bindable]
		[PropertyBinding(modelVideo="modelAll.currentPlay@")]
		[PropertyBinding(nameToDisplay="{Name to display}")]
		[PropertyBinding(describeToDisplay="{Describe}")]
		public var videoPlayerComponent:VideoPlayerComponent;
		
		[Bindable]
		[SkinPart]
		[PropertyBinding(dataProvider = "modelAll.listVideo@")]
		[EventHandling(event="change",handler="listReferenceVideo_change")]
		public var listReferenceVideo:List;
		
		public function setData(video:Video,listVideo:ArrayList):void{
			videoPlay = video;
			referenceList = listVideo;
		}
		
		
		public function listReferenceVideo_change(event:Event):void
		{
			modelAll.currentPlay = listReferenceVideo.selectedItem as Video;
			videoPlayerComponent.loadVideo();
		}
		
		
		public function VideoPlayerView()
		{
			super();
		//	initApp();
		}
		
		protected function initApp():void
		{
			// TODO Auto-generated method stub
			var listVideo:ArrayList = new ArrayList();
			var videoPl:model.Video = new model.Video("https://www.youtube.com/watch?v=NEzjBwKtG84","Desing Parten","Design pattern");
			listVideo.addItem(new model.Video("https://www.youtube.com/watch?v=D2433xS0nEk","Flex","Part 5 Building Over The Rhine Website in Adobe"));
			listVideo.addItem(new model.Video("https://www.youtube.com/watch?v=E8tdcSvEZeY","Flex","Part 4 Building Over The Rhine Website in Adobe"));
			listVideo.addItem(new model.Video("https://www.youtube.com/watch?v=fAZmHUvH8AM","Flex","[Lập trình Flex] Day 1 - Part2 - Building a da"));
			listVideo.addItem(new model.Video("https://www.youtube.com/watch?v=GH3f8Xa8L_Q","Flex","Part 3 Building Over The Rhine Website in Adobe"));
			listVideo.addItem(new model.Video("https://www.youtube.com/watch?v=RyNf5r65yXE","Flex","Part 1 Building Over The Rhine Website in Adobe"));
			listVideo.addItem(new model.Video("https://www.youtube.com/watch?v=sTN_4E0r0jc","Flex","[Lập trình Flex] Day1 - Part1 - Introduction"));
			listVideo.addItem(new model.Video("https://www.youtube.com/watch?v=EDnqBNgwWTw","Flex","Yahoo Maps Part 3 (1 of 4): Grabbing the Custom Marker Class "));
			
			
			setData(videoPl,listVideo);
		}
		
		[Bindable]
		[SkinPart(required="true",type="static")]
		[EventHandling(event="click",handler="derectButton_click")]
		public var nextVideo:Button;
		
		[Bindable]
		[SkinPart(required="true",type="static")]
		[EventHandling(event="click",handler="derectButton_click")]
		public var prevVideo:Button;
		
		[Bindable]
		[SkinPart(required="true",type="static")]
		[EventHandling(event="click",handler="derectButton_click")]
		public var replay:Button;
		
		public var currentIndex:int;
		
		public function updateDerectButton():void
		{
			prevVideo.enabled = (currentIndex > 0) ;
			nextVideo.enabled = (currentIndex < modelAll.listVideo.length -1);
		}
		
		public function derectButton_click(event:MouseEvent):void
		{
			if(event.currentTarget == replay){
				videoPlayerComponent.loadVideo();
				return;
			}
				
			currentIndex = modelAll.listVideo.getItemIndex(modelAll.currentPlay);
			if(event.currentTarget == prevVideo){
				currentIndex--;
			} else {
				currentIndex++;
			}
			modelAll.currentPlay = model.Video( modelAll.listVideo.getItemAt(currentIndex));
			updateDerectButton();
			videoPlayerComponent.loadVideo();
		}
	}
}