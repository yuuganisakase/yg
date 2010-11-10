package test 
{
	import flexunit.framework.Assert;
	/**
	 * ...
	 * @author 
	 */
	public class HogeTest1
	{
		
		public function HogeTest1() 
		{
			

		}
		[Test]
		public function add():void {
			var hoge:Hoge = new Hoge();
			Assert.assertEquals(9, hoge.add(4, 5));
		}
		
	}

}