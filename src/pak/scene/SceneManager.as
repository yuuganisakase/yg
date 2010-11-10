package pak.scene 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import pak.scene.base.SceneBase;
	import pak.scene.scene1.Scene1;
	
	/**
	 * ...
	 * @author 
	 */
	public class SceneManager extends Sprite
	{
		private var currentScene:SceneBase;
		
		public function SceneManager() 
		{
			init();
		}
		
		private function init():void
		{
			currentScene = new Scene1();
			currentScene.init();
			addChild(currentScene.view);
			currentScene.startScene();
			currentScene.addEventListener(Event.COMPLETE, onSceneComplete);
			
		}
		
		private function onSceneComplete(e:Event):void 
		{
			currentScene.removeEventListener(Event.COMPLETE, arguments.callee);
			var tempScene:SceneBase = currentScene.getNextScene();
			
			currentScene.endScene();
			currentScene = null;
			
			currentScene = tempScene;
			currentScene.init();
			addChild(currentScene.view);
			currentScene.startScene();
			currentScene.addEventListener(Event.COMPLETE, onSceneComplete);
			
		}
		
	}

}