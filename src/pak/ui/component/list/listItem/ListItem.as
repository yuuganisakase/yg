package pak.ui.component.list.listItem 
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import pak.ui.component.core.TextItem;
	import pak.ui.Style;
	
	/**
	 * ...
	 * @author 
	 */
	public class ListItem extends TextItem
	{
		private var data:*;
		private var labelFunc:Function;

		public function ListItem(_data:*, _labelFunc:Function = null) 
		{
			data = _data;
			
			var back:Shape = new Shape();
			back.graphics.beginFill(0x000000, 0.5);
			back.graphics.drawRect(0, 0, Style.ListWidth, 20);
			addChild(back);
			if (_labelFunc == null) {
				labelFunc = normalLabelFunc;
			}else {
				labelFunc = _labelFunc;	
			}
			
			super();
			tf.width = Style.ListWidth;
			tf.autoSize = TextFieldAutoSize.LEFT
			tf.text = labelFunc(data);
			
			trace(" this.width = "  + this.width);
			
			this.addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
			this.addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
			this.addEventListener(MouseEvent.CLICK, onMouseClick);

		}
		
		private function onMouseClick(e:MouseEvent):void 
		{
			
		}
		
		private function onMouseOut(e:MouseEvent):void 
		{
			this.transform.colorTransform = new ColorTransform();
		}
		
		private function onMouseOver(e:MouseEvent):void 
		{
			this.transform.colorTransform = new ColorTransform(1, 1, 1, 1, 88, 88, 88);
		}

		
		
		private function normalLabelFunc(a:*):String {
			return a.toString();
		}
		public function setSize(ww:Number, hh:Number):void
		{
			
		}
		public function getData():*
		{
			return data;
		}
		public function setLabelFunc(f:Function):void
		{
			labelFunc = f;
		}
	}

}