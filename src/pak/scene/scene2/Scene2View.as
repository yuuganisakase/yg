package pak.scene.scene2 
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
	public class Scene2View extends SceneBaseView
	{
		
		public function Scene2View() 
		{
			var sh:Shape = new Shape();
			sh.graphics.beginFill(0x0000ff);
			sh.graphics.drawCircle(100, 100, 300);
			addChild(sh);
			
			var button:PushButton = new PushButton(this, 100, 150, "button", onButton);
		}
		
		private function onButton(e:MouseEvent):void
		{
			dispatchEvent(new Event("buttonPush"));
		}
		
	}

}