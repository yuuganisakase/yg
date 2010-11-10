package  
{
	import de.polygonal.ds.mem.IntMemory;
	import de.polygonal.gl.VectorRenderer;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author 
	 */
	public class NormalMain extends Sprite
	{
		private var ar:Vector.<Particle> = new Vector.<Particle>();
		private var sh:Shape;
		
		public function NormalMain() 
		{
			

			
			for (var i:int = 0; i < 5; i++) 
			{
				trace(i + " = " + a.get(i));
			}
			makeParticles();
			sh = new Shape();
			addChild(sh);
			addEventListener(Event.ENTER_FRAME, onEnter);
			graphics.beginFill(Math.random());
			
			
		}
		private var render:VectorRenderer = new VectorRenderer(2048, 512);
		private var num:Number = 60;
		private function onEnter(e:Event):void 
		{
			if (true) {
				graphics.clear();
				
				graphics.beginFill(0xff0000,1);
				graphics.lineStyle(1, 0x000000,0.2);
				for each(var p:Particle in ar) {
					p.update();
				}
				for (var j:int = 0; j < num/4; j++){
					
					//graphics.drawCircle(ar[j].xx, ar[j].yy, ar[j].rad);
					for (var i:int = 0; i < num; i++) 
					{
						
						graphics.moveTo(ar[j].xx, ar[j].yy);
						graphics.lineTo(ar[i].xx, ar[i].yy);
					}
				}
				
				graphics.endFill();
			}else {
				
				for (var j:int = 0; j < num/2; j++){
					ar[j].update();
					//graphics.drawCircle(ar[j].xx, ar[j].yy, ar[j].rad);
					for (var i:int = 0; i < num; i++) 
					{
						
						graphics.moveTo(ar[j].xx, ar[j].yy);
						graphics.lineTo(ar[i].xx, ar[i].yy);
					}
				}
				
				graphics.endFill();
			}
			
		}
		public function makeParticles():void {
			for (var i:int = 0; i < num; i++) 
			{
				ar.push(new Particle());
			}
		}
		
	}

}
import flash.geom.Point;

class Pool
{
	
}

class Particle
{
	public var ax:Number = 0;
	public var ay:Number = 0;
	public var vx:Number = Math.random()*4 - 2;
	public var vy:Number = Math.random()*4 - 2;
	public var xx:Number = Math.random()*800;
	public var yy:Number = Math.random() * 600;
	public var rad:Number = Math.random() * 1 + 1;
	private var centerPoint:Point = new Point(400, 300);
	private const Dist:Number = 60;
	private const limit:Number = 16;
	public function update():void
	{

		
		
		xx += vx;
		yy += vy;
		vx += ax;
		vy += ay;
		var vp:Point = new Point(vx, vy);
		if (vp.length > limit) {
			vp.normalize(limit);
			vx = vp.x;
			vy = vp.y;
		}
		
		check();
	}
	
	
	private function check():Boolean {
		var here:Point = new Point(xx, yy);
		var d:Number = Point.distance(here, centerPoint);
		if (d > Dist) {
			var v1:Point = new Point(xx - centerPoint.x, yy - centerPoint.y);
			v1.normalize(30);
			var v2:Point = new Point( -vx, -vy);
			var v3:Point = v1.add(v2);
			ax -= v3.x;
			ay -= v3.y;
			var aLimit:Number = 24;
			var ap:Point = new Point(ax, ay);
			if (ap.length > aLimit) {
				ap.normalize(aLimit);
				ax = ap.x;
				ay = ap.y;
			}
			
			
		}else {
			ax = 0;
			ay = 0;
		}
		return true;
	}
	
	
	
}