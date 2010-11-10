package pak.scene.base 
{
	import flash.display.DisplayObjectContainer;
	import flash.events.EventDispatcher;
	
	/**
	 * ...
	 * @author 
	 */
	public class SceneBase extends EventDispatcher
	{
		public var view:SceneBaseView;
		public var model:SceneBaseModel;
		
		
		public function SceneBase() 
		{
			
		}
		
		public function init():void
		{
			
		}
		public function startScene():void 
		{
			
		}
		
		public function endScene():void 
		{
			
		}
		
		public function getNextScene():SceneBase
		{
			return model._nextScene;
		}
		
	}

}