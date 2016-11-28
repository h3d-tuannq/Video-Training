package views
{
	
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import mx.collections.ArrayList;
	import mx.core.INavigatorContent;
	import mx.core.IVisualElement;
	import mx.events.FlexEvent;
	
	import spark.components.Button;
	
	import abstract.NavinatorView;
	
	import model.Video;
	
	import net.fproject.ui.containers.VerticalTabNavigator;
	import net.projectkit.gui.component.DialogBase;
	
	import util.PlayListModel;
	
	[EventHandling(event="mx.events.FlexEvent.CREATION_COMPLETE",handler="initApp")]
	public class VideoModuleBase extends NavinatorView implements INavigatorContent
	{
		
		
		[Bindable]
		public var playVideo:PlayListModel;
		
		public function VideoModuleBase()
		{
			super();
		}
		
		public function setData(value:Object):void
		{
		//	initApp();
		}
		
		private var _activeView:NavinatorView;
		
		public function get activeView():NavinatorView{
			return _activeView;
		}
		
		public function bodyTab_valueCommit(event:FlexEvent):void
		{
			changeViewCode(bodyTab.selectedChild );
			DialogBase.closeAllDialogs();
		}
		
		public function changeViewCode(view:IVisualElement):void{
			view = view as NavinatorView;
			switch(view)
			{
				case playView:
				{
					break;
				}
					
				case playView:
				{
					break;
				}
			}
		}
		
		public function initApp(event:Event):void
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
			
			listVideo.addItem(new model.Video("https://www.youtube.com/watch?v=D2433xS0nEk","Flex","Part 5 Building Over The Rhine Website in Adobe"));
			listVideo.addItem(new model.Video("https://www.youtube.com/watch?v=E8tdcSvEZeY","Flex","Part 4 Building Over The Rhine Website in Adobe"));
			listVideo.addItem(new model.Video("https://www.youtube.com/watch?v=fAZmHUvH8AM","Flex","[Lập trình Flex] Day 1 - Part2 - Building a da"));
			listVideo.addItem(new model.Video("https://www.youtube.com/watch?v=GH3f8Xa8L_Q","Flex","Part 3 Building Over The Rhine Website in Adobe"));
			listVideo.addItem(new model.Video("https://www.youtube.com/watch?v=RyNf5r65yXE","Flex","Part 1 Building Over The Rhine Website in Adobe"));
			listVideo.addItem(new model.Video("https://www.youtube.com/watch?v=sTN_4E0r0jc","Flex","[Lập trình Flex] Day1 - Part1 - Introduction"));
			listVideo.addItem(new model.Video("https://www.youtube.com/watch?v=EDnqBNgwWTw","Flex","Yahoo Maps Part 3 (1 of 4): Grabbing the Custom Marker Class "));
		
			playVideo = new PlayListModel();
			playVideo.title = "All Video";
			playVideo.listVideo = listVideo;
			playView.videoPlayerComponent.loadVideo();			
			
			//setData(videoPl,listVideo);
		}
		
		
		
		[SkinPart(required="true",type="static")]
		[EventHandling(event="mx.events.FlexEvent.VALUE_COMMIT",handler="bodyTab_valueCommit")]
		public var bodyTab:VerticalTabNavigator;
		
		[SkinPart(required="true" , type="static")]
		public var controlView:ControlVideoView;
		
		[SkinPart(required="true" , type="static")]
		public var listView:VideoListView;
		
		[SkinPart(required="true",type="static")]
		[Bindable]
		[PropertyBinding(modelAll="playVideo@")]
		public var playView:VideoPlayerView;
		
		/*[Bindable]
		[SkinPart(required="true",type="static")]
		[EventHandling(event="click",handler="changeVideoButton_click")]
		public var changeVideoButton:Button;
		
		public function changeVideoButton_click(event:MouseEvent):void
		{
		//	video = new model.Video("https://www.youtube.com/watch?v=hkDD0T9o7P0","Flex","Part 1 Building Over The Rhine Website in Adobe");
		}*/
	}
}