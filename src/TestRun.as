package  
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import org.flexunit.runner.FlexUnitCore;
	import pak.test.ResultPanelListener;
	import test.HogeTest1;
	
	/**
	 * ...
	 * @author 
	 */
	public class TestRun extends Sprite
	{
		
		public function TestRun() 
		{
			var core:FlexUnitCore = new FlexUnitCore();
			core.addListener(new ResultPanelListener());
			core.run(HogeTest1);
			
			
		}
		
	}

}