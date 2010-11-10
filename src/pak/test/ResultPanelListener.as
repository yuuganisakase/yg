package pak.test 
{
	import org.flexunit.internals.TraceListener;
	import org.flexunit.runner.notification.Failure;
	
	/**
	 * ...
	 * @author 
	 */
	public class ResultPanelListener extends TraceListener
	{
		
		public function ResultPanelListener() 
		{
			super();
		}
		
		override protected function printFailure(failure:Failure, prefix:String):void 
		{
			super.printFailure(failure, prefix);
			
			setFlashDevelopResultsPanel(failure); // FlashDevelopのResultsパネルに出力するメソッドを実行
		}
		
		/**
		 * FlashDevelopのResultsパネルにテスト結果（レッド）を表示するtraceを出力します.
		 * @param	error
		 */
		private function setFlashDevelopResultsPanel(error:Failure):void
		{
			var stackTrace:String = error.stackTrace;
			var pattern:RegExp = /\[[^)]+\]/g;
			var result:Object = pattern.exec(stackTrace);
			while (result != null)
			{
				var array:Array = result[0].replace("[", "").replace("]","").split(":");
				trace(array[0] + ":" + array[1] + "(" + array[2] + "): [WARN] " + error.message);
				result = pattern.exec(stackTrace);
			}
		}		
	}

}