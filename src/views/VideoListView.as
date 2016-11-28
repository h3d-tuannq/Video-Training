package views
{
	import flash.events.Event;
	
	import mx.collections.ArrayList;
	import mx.core.INavigatorContent;
	
	import spark.components.List;
	import spark.components.NavigatorContent;
	
	import events.SelectListVideo;
	
	import model.Movie;
	import model.Video;
	
	import net.fproject.di.Injector;
	
	import util.PlayListModel;

	[EventHandling(event="mx.events.FlexEvent.CREATION_COMPLETE",handler="initListData")]
	public class VideoListView extends NavigatorContent implements INavigatorContent
	{
		
		[Bindable]
		public var videoListAll:ArrayList;
		
		[Bindable]
		public var listPlay:PlayListModel;
		
		[Bindable]
		public var vp:Video;
		
		[Bindable]
		[SkinPart(required="true",type="static")]
		[PropertyBinding(dataProvider = "videoListAll@")]
		[EventHandling(event="playNextListVideo",handler="allTypeList_change")]
		public var allTypeList:List;
		
		[Bindable]
		[SkinPart(required="true",type="static")]
		//[PropertyBinding(videoPlay = "vp@")]
		//[PropertyBinding(referenceList = "listPlay.listVideo@")]
		[PropertyBinding(modelAll="listPlay@")]
		public var playTypeListVideo:VideoPlayerView;
		
		
		public function initListData(event:Event):void
		{
			addListVideo();
		}
		
		public function allTypeList_change(event:Event):void
		{
			if(event is SelectListVideo){
				listPlay = SelectListVideo(event).data as PlayListModel;
				playTypeListVideo.setFocus();
				playTypeListVideo.videoPlayerComponent.loadVideo();
			}
			
		}
		
		protected function addListVideo():void
		{
			var listFlex:ArrayList = new ArrayList();
			var listDP:ArrayList = new ArrayList();
			var listPK:ArrayList = new ArrayList();
			var listAll:ArrayList = new ArrayList();
			
			for(var i:int =0 ; i<2; i++){
				listFlex.addItem(new model.Video("https://www.youtube.com/watch?v=D2433xS0nEk","Flex","Part 5 Building Over The Rhine Website in Adobe"));
				listFlex.addItem(new model.Video("https://www.youtube.com/watch?v=E8tdcSvEZeY","Flex","Part 4 Building Over The Rhine Website in Adobe"));
				listFlex.addItem(new model.Video("https://www.youtube.com/watch?v=fAZmHUvH8AM","Flex","[Lập trình Flex] Day 1 - Part2 - Building a da"));
				listFlex.addItem(new model.Video("https://www.youtube.com/watch?v=GH3f8Xa8L_Q","Flex","Part 3 Building Over The Rhine Website in Adobe"));
				listFlex.addItem(new model.Video("https://www.youtube.com/watch?v=RyNf5r65yXE","Flex","Part 1 Building Over The Rhine Website in Adobe"));
				listFlex.addItem(new model.Video("https://www.youtube.com/watch?v=sTN_4E0r0jc","Flex","[Lập trình Flex] Day1 - Part1 - Introduction"));
				listFlex.addItem(new model.Video("https://www.youtube.com/watch?v=EDnqBNgwWTw","Flex","Yahoo Maps Part 3 (1 of 4): Grabbing the Custom Marker Class "));
				
			}
			listDP.addItem(new model.Video("https://www.youtube.com/watch?v=YDobmucohqk",Movie.TYPE_DESIGN_PATTERN,"Design pattern"));
			listDP.addItem(new model.Video("https://www.youtube.com/watch?v=wiQdrH2YpT4",Movie.TYPE_DESIGN_PATTERN,"Observer Design Pattern"));
			listDP.addItem(new model.Video("https://www.youtube.com/watch?v=NZaXM67fxbs",Movie.TYPE_DESIGN_PATTERN,"Singleton Design Pattern Tutorial"));
			listDP.addItem(new model.Video("https://www.youtube.com/watch?v=9XnsOpjclUg",Movie.TYPE_DESIGN_PATTERN,"Builder Design Pattern "));
			listDP.addItem(new model.Video("https://www.youtube.com/watch?v=j40kRwSm4VE",Movie.TYPE_DESIGN_PATTERN,"Decorator Design Pattern "));
			listDP.addItem(new model.Video("https://www.youtube.com/watch?v=0jjNjXcYmAU",Movie.TYPE_DESIGN_PATTERN,"Design Patterns - An introduction"));
			listDP.addItem(new model.Video("https://www.youtube.com/watch?v=mym5m-GKG0Q",Movie.TYPE_DESIGN_PATTERN,"CS164 Lecture 3 Design Patterns"));
			
			
			
			listPK.addItem(new model.Video("https://www.youtube.com/watch?v=bEpvu210TvA", Movie.TYPE_PROJECTKIT_TRAINING, "ProjectKit Training"));
			listPK.addItem(new model.Video("https://www.youtube.com/watch?v=fAZmHUvH8AM", Movie.TYPE_PROJECTKIT_TRAINING, "[Lập trình Flex] Day 1 - Part2 - "));
			listPK.addItem(new model.Video("https://www.youtube.com/watch?v=iiw9zGHnANQ", Movie.TYPE_PROJECTKIT_TRAINING, "[Lập trình Flex] day2 part 2"));
			listPK.addItem(new model.Video("https://www.youtube.com/watch?v=ZKQLlyoKLnU", Movie.TYPE_PROJECTKIT_TRAINING, "[Lập trình Flex] day2 part 3"));
			listPK.addItem(new model.Video("https://www.youtube.com/watch?v=oW_UIUkeDuc", Movie.TYPE_PROJECTKIT_TRAINING, "[Lập trình Flex] day2 part 4."));
			listPK.addItem(new model.Video("https://www.youtube.com/watch?v=frwFUZY5qrI", Movie.TYPE_PROJECTKIT_TRAINING, "[Lập trình Flex] day2 part 5"));
			listPK.addItem(new model.Video("https://www.youtube.com/watch?v=6VYmIVLb5tc", Movie.TYPE_PROJECTKIT_TRAINING, "[Lập trình Flex] day2 part 6"));
			
			
			var arrPk:PlayListModel = new PlayListModel();
			arrPk.title = "Danh Sach Video PK";
			arrPk.listVideo = listPK;
			
			var arrDP:PlayListModel = new PlayListModel();
			arrDP.title = "Danh Sach Video Design Pattern";
			arrDP.listVideo = listDP;
			
			var arrFlex:PlayListModel = new PlayListModel();
			arrFlex.title = "Danh Sach Video Flex ";
			arrFlex.listVideo = listFlex;
			
			listAll.addAll(listDP);
			listAll.addAll(listFlex);
			listAll.addAll(listPK);
			
			var arrALl:PlayListModel = new PlayListModel();
			arrALl.title = "All Video";
			arrALl.listVideo = listAll;
			
			videoListAll = videoListAll == null ? new ArrayList() :videoListAll ;
			
			videoListAll.addItem(arrALl);
			videoListAll.addItem(arrPk);
			videoListAll.addItem(arrDP);
			videoListAll.addItem(arrFlex);
			
			
			listPlay = arrDP;
			playTypeListVideo.videoPlayerComponent.loadVideo();
			
		}
		
		
		public function VideoListView()
		{
			Injector.inject(this);
		}
		
	}
}