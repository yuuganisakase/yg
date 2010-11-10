package  
{
	import com.bit101.components.Label;
	import com.bit101.components.PushButton;
	import com.greensock.loading.display.ContentDisplay;
	import com.greensock.loading.LoaderMax;
	import com.greensock.loading.SWFLoader;
	import de.polygonal.ds.mem.MemoryAccess;
	import de.polygonal.ds.mem.MemoryManager;
	import de.polygonal.ds.Vector;
	import de.polygonal.gl.VectorRenderer;
	import de.polygonal.motor2.geom.math.Vec2;
	import flash.Boot;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flexunit.framework.Test;
	import mx.collections.ArrayCollection;
	import mx.events.PropertyChangeEvent;
	import net.digitalprimates.fluint.ui.TestRunner;
	import pak.scene.SceneManager;
	import pak.ui.component.list.ListController;
	import pak.ui.component.list.listItem.ListItem;
	import pak.ui.component.slider.SliderController;
	
	
	/**
	 * ...
	 * @author 
	 */
	public class Main extends MovieClip
	{
		private var list:ListController;
		
		[Bindable] public var array:ArrayCollection = new ArrayCollection([1, 2]);
		private var swf:SWFLoader;
		
		
		public function Main() 
		{
			var a:SceneManager = new SceneManager();
			//addChild(a);
			
			//swf = new SWFLoader("PoolG.swf", { name:"swf1" , onComplete:onComp} );
			//swf.load();
			//new Boot(this);
			//MemoryManager.realloc(new MemoryAccess(4096),4096);
			
			var rend:VectorRenderer = new VectorRenderer();
			//rend.style.lineColor = 0xff0000;
			//rend.style.lineThickness = 3;
			//rend.style.lineAlpha = 1;
			//rend.applyLineStyle();
			rend.setFillColor(0xff0000);
			rend.fillStart();
			rend.arrowLine3(new Vec2(100, 100), new Vec2(500, 500), 500);
			rend.setFillColor(0x000000);
			rend.fillStart();
			rend.rect4(200, 200, 20, 20);
			rend.setFillColor(0x00ffff);
			rend.fillStart();
			rend.circle2(new Vec2(300, 300), 50);
			rend.flush(graphics);
			var rr:vectorren
			
			//var ar:ArrayCollection = new ArrayCollection([1, 2, 3, 4, 5,6,7,8,9,10,11,12,13,14,15,16,17,18]);
			//list = new ListController(ar, this);
			//list.move(150, 150);
			//var ll:PushButton = new PushButton(this, 300, 30, "button", onPush);
			//var up:PushButton = new PushButton(this, 300, 60, "up", onUp);
			//var down:PushButton = new PushButton(this, 300, 90, "down", onDown);
			//addEventListener(PropertyChangeEvent.PROPERTY_CHANGE, onChange);
		}
		
		private function func( a:int ) : void{
			
		}
		private function onComp(e:Event):void
		{
			var mc:ContentDisplay = swf.getContent("swf1") as ContentDisplay;
			var bclass:Class = swf.getClass("res.Btable4");
			var ball:MovieClip = new bclass();
			ball.x = ball.y = 100;
			//addChild(ball);
		}
		private function onDown(e:MouseEvent):void
		{
			list.view.goDown(10);
		}
		
		private function onUp(e:MouseEvent):void
		{
			list.view.goUp(10);
		}
		
		private function onChange(e:PropertyChangeEvent):void 
		{
			trace(" propertychange = " + array);
		}
		
		private function onPush(e:MouseEvent):void
		{
			list.model.data.addItem("aiueo");
		}
		
	}

}