package abstract
{
	import mx.core.INavigatorContent;
	
	import spark.components.NavigatorContent;
	
	import net.fproject.di.Injector;

	public class NavinatorView extends NavigatorContent implements INavigatorContent
	{
		public function NavinatorView()
		{
			Injector.inject(this);
		}
	}
}