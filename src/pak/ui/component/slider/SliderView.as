package pak.ui.component.slider
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	
	/**
	 * ...
	 * @author 
	 */
	public class SliderView extends Sprite
	{
		public var button:Sprite;
		public var back:Sprite;
		
		public function SliderView(bx:Number, by:Number, backX:Number, backY:Number) 
		{
			//this.x = bx;
			//this.y = by;
			
			back = new Sprite();
			back.graphics.beginFill(0x222222, 0.9);
			back.graphics.drawRect(0, 0, backX, backY);
			addChild(back);
			
			button = new Sprite();
			button.graphics.beginFill(0xbbbbbb);
			button.graphics.drawRoundRect(0, 0, bx, by, 9, 9);
			addChild(button);
			
		}
		public function move(xx:Number, yy:Number):void
		{
			this.x = xx; this.y = yy;
		}
		
	}

}