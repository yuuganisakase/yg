package pak.scene.scene2 
{
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import org.libspark.betweenas3.BetweenAS3;
	import org.libspark.betweenas3.easing.Sine;
	import org.libspark.betweenas3.tweens.ITween;
	import pak.scene.base.SceneBase;
	import pak.scene.scene1.Scene1;
	import pak.scene.scene3.Scene3;
	
	/**
	 * ...
	 * @author 
	 */
	public class Scene2 extends SceneBase
	{
		
		public function Scene2() 
		{
			
		}
		override public function init():void {
			super.init();
			
			view = new Scene2View();
			
			view.addEventListener("buttonPush", onViewButton);
			model = new Scene2Model();
			
		}
		override public function startScene():void {
			var tween:ITween = BetweenAS3.serial(
			BetweenAS3.tween(view, { y:0 }, { y: -500 }, 1.5, Sine.easeOut));
			tween.play();
		}
		override public function endScene():void {
			view.parent.removeChild(view);
		}
		private function onViewButton(e:Event):void 
		{
			model._nextScene = new Scene3();
			dispatchEvent(new Event(Event.COMPLETE));
		}
	}

}