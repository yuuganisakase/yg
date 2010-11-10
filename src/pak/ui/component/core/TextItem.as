package pak.ui.component.core 
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.ColorTransform;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import pak.ui.Style;
	
	/**
	 * ...
	 * @author 
	 */
	public class TextItem extends Sprite
	{
		public var tf:TextField;
		
		public function TextItem() 
		{
			
			tf = new TextField();
			var format:TextFormat = new TextFormat("_ゴシック", Style.LabelSize,Style.LabelColor);
			tf.defaultTextFormat = format;
			//tf.autoSize = TextFieldAutoSize.LEFT;
			addChild(tf);
			
		}
		
		
		
		
	}

}