package pak.ui.component.list 
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import mx.collections.ArrayCollection;
	import pak.ui.component.list.listItem.ListItem;
	import pak.ui.Style;
	
	public class ListView extends Sprite
	{
		private var holder:Sprite;
		public var dispWidth:Number;
		public var dispHeight:Number;
		
		public static const HeightOverflowEvent:String = "heightOverflow";
		public static const ListMoveEvent:String = "listMove";
		
		
		public function ListView() 
		{
			holder = new Sprite();
			holder.addEventListener(MouseEvent.MOUSE_WHEEL, onMouseWheel);
			addChild(holder);
		}
		
		private function onMouseWheel(e:MouseEvent):void 
		{
			if (e.delta > 0) {
				goUp(Style.WheelDeltaSize);
			}else {
				goDown(Style.WheelDeltaSize);
			}
		}
		
		public function validateFromArray(data:ArrayCollection):void
		{
			var i:int = 0;
			for (i = 0; i < holder.numChildren-1; i++) 
			{
				holder.removeChildAt(i);
			}
			for (i = 0; i < data.length; i++) 
			{
				var item:ListItem = new ListItem(data.getItemAt(i));
				item.y = i * item.height;
				holder.addChild(item);
			}
		}
		public function setSize(ww:Number, hh:Number):void
		{
			dispWidth = ww;
			dispHeight = hh;
			
			var sh:Shape = new Shape();
			sh.graphics.beginFill(0x000000);
			sh.graphics.drawRect(0, 0, ww, hh);
			addChild(sh);
			holder.mask = sh;
			if (holder.height > dispHeight) {
				trace(" add slider = ");
				dispatchEvent(new Event(ListView.HeightOverflowEvent));
			}
		}
		public function goDown(num:Number):void
		{
			holder.y -= num;
			if (checkScroll() == false) holder.y += num;
			dispatchEvent(new Event(ListView.ListMoveEvent));
		}
		public function goUp(num:Number):void
		{
			holder.y += num;
			if (checkScroll() == false) holder.y -= num;
			dispatchEvent(new Event(ListView.ListMoveEvent));
		}
		public function movePercent(per:Number, event:Boolean = true):void
		{
			if (per > 1 || per < 0) return;
			holder.y = ( -holder.height + dispHeight) * per;
			if(event) dispatchEvent(new Event(ListView.ListMoveEvent));
		}
		public function getPercent():Number
		{
			trace("  = "  + (holder.y / ( -holder.height + dispHeight)));
			return (holder.y / ( -holder.height + dispHeight))
		}
		private function checkScroll():Boolean {
			if (holder.y > 0) return false;
			if (holder.y < ( -holder.height + dispHeight)) return false;
			
			return true;
		}
	}

}