package pak.scene.scene3
{
	import com.bit101.components.PushButton;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import pak.scene.base.SceneBaseView;
	
	/**
	 * ...
	 * @author 
	 */
	public class Scene3View extends SceneBaseView
	{
		
		public function Scene3View() 
		{
			var sh:Shape = new Shape();
			sh.graphics.beginFill(0x00ff00);
			sh.graphics.drawRoundRect(10, 10,200,200,50,50);
			addChild(sh);
			
			var button:PushButton = new PushButton(this, 100, 150, "button", onButton);
		}
		
		private function onButton(e:MouseEvent):void
		{
			dispatchEvent(new Event("buttonPush"));
		}
		
	}

}