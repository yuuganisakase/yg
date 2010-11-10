package pak.ui.component.slider
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	
	/**
	 * ...
	 * @author 
	 */
	public class SliderController extends EventDispatcher
	{
		private var view:SliderView;
		private var parent:DisplayObjectContainer;
		
		private var minNumber:Number;
		private var maxNumber:Number;
		private var sliderLength:Number;
		
		public static const SliderMoveEvent:String = "slidermove";
		public function SliderController(_parent:DisplayObjectContainer, ww:Number = 20, yy:Number = 300) 
		{
			parent = _parent;
			var backX:Number = ww;
			var backY:Number = yy;
			var bx:Number = 20;
			var by:Number = 40;
			minNumber = 0;
			maxNumber = backY - by;
			sliderLength = maxNumber - minNumber;
			
			view = new SliderView(bx, by, backX, backY);
			
			parent.addChild(view);			
			view.move(parent.width, 0);
			
			view.button.buttonMode = true;
			view.button.addEventListener(MouseEvent.MOUSE_DOWN, onButtonMouseDown);
			
		}
		
		private function onButtonMouseUp(e:MouseEvent):void 
		{
			parent.stage.removeEventListener(MouseEvent.MOUSE_UP, onButtonMouseUp);
			parent.stage.removeEventListener(MouseEvent.MOUSE_MOVE, onSlide);
			view.button.stopDrag();
		}
		
		private function onSlide(e:MouseEvent):void 
		{
			dispatchEvent(new Event(SliderController.SliderMoveEvent));
		}
		
		private function onButtonMouseDown(e:MouseEvent):void 
		{
			parent.stage.addEventListener(MouseEvent.MOUSE_UP, onButtonMouseUp);
			parent.stage.addEventListener(MouseEvent.MOUSE_MOVE, onSlide);

			view.button.startDrag(false, new Rectangle(0, 0, 0, sliderLength));
		}
		public function move(xx:Number, yy:Number):void
		{
			view.move(xx, yy);
		}
		public function moveSlide(num:Number, event:Boolean = true):void
		{
			if (num < 0 || num > 1) return;
			view.button.y = sliderLength * num;
			if(event) dispatchEvent(new Event(SliderController.SliderMoveEvent));
		}
		public function getButtonPosition():Number {
			return view.button.y / sliderLength;
		}
		
		
		
	}

}