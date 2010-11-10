package pak.scene.scene1 
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
	public class Scene1View extends SceneBaseView
	{
		
		public function Scene1View() 
		{
			var sh:Shape = new Shape();
			sh.graphics.beginFill(0xff0000);
			sh.graphics.drawRect(0, 0, 300, 300);
			addChild(sh);
			
			var button2:PushButton = new PushButton(this, 200, 210, "button2", onButton2);
			var button3:PushButton = new PushButton(this, 200, 290, "button3", onButton3);
		}
		
		private function onButton3(e:MouseEvent):void
		{
			dispatchEvent(new Event("buttonPush3"));
		}
		
		private function onButton2(e:MouseEvent):void
		{
			dispatchEvent(new Event("buttonPush2"));
		}
		
	}

}