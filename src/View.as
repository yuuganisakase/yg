package  
{
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	/**
	 * ...
	 * @author 
	 */
	public class View extends Sprite
	{
		
		public function View() 
		{
			var tf:TextField = new TextField();
			tf.text = "aiueo";
			tf.autoSize = TextFieldAutoSize.RIGHT
			addChild(tf);
			trace(" tf = "  + tf.width);
		}
		
	}

}