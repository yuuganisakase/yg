package pak.scene.scene1 
{
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import org.libspark.betweenas3.BetweenAS3;
	import org.libspark.betweenas3.easing.Sine;
	import org.libspark.betweenas3.tweens.ITween;
	import pak.scene.base.SceneBase;
	import pak.scene.scene2.Scene2;
	import pak.scene.scene3.Scene3;
	import pak.scene.SceneConfig;
	
	/**
	 * ...
	 * @author 
	 */
	public class Scene1 extends SceneBase
	{
		
		public function Scene1() 
		{
			
		}
		override public function init():void {
			super.init();
			
			view = new Scene1View();
			view.addEventListener("buttonPush2", onViewButton2);
			view.addEventListener("buttonPush3", onViewButton3);
			model = new Scene1Model();
		}
		override public function startScene():void
		{
			var tween:ITween = BetweenAS3.serial(
			BetweenAS3.tween(view, {x:0 }, { x: -500 }, 1.5, Sine.easeOut)
			);
			tween.play();
		}
		override public function endScene():void 
		{
			var tween:ITween = BetweenAS3.serial(
			BetweenAS3.tween(view, {x:-500 }, { x: 0 }, 1.5, Sine.easeOut),
			BetweenAS3.removeFromParent(view)
			
			);
			tween.play();
		}
		private function onViewButton3(e:Event):void 
		{
			var cl:Class = SceneConfig.Scene1ToButton1;
			model._nextScene = new cl();
			dispatchEvent(new Event(Event.COMPLETE));
		}

		private function onViewButton2(e:Event):void 
		{
			var cl:Class = SceneConfig.Scene1ToButton2;
			model._nextScene = new cl();
			dispatchEvent(new Event(Event.COMPLETE));
		}
	}

}