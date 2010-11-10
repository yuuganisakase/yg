package pak.scene.scene3
{
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import pak.scene.base.SceneBase;
	import pak.scene.scene1.*;
	
	/**
	 * ...
	 * @author 
	 */
	public class Scene3 extends SceneBase
	{
		
		public function Scene3() 
		{
			
		}
		override public function init():void {
			super.init();
			
			view = new Scene3View();
			
			view.addEventListener("buttonPush", onViewButton);
			model = new Scene3Model();
			
		}
		override public function endScene():void {
			view.parent.removeChild(view);
		}
		private function onViewButton(e:Event):void 
		{
			model._nextScene = new Scene1();
			dispatchEvent(new Event(Event.COMPLETE));
		}
	}

}