package pak.ui.component.list
{
	
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import mx.collections.ArrayCollection;
	import pak.ui.component.list.listItem.ListItem;
	import pak.ui.component.slider.SliderController;
	import pak.ui.Style;
	

	public class ListController extends EventDispatcher
	{
		
		public var view:ListView;
		public var model:ListModel;
		private var slider:SliderController;
		
		public function ListController(_data:ArrayCollection, p:DisplayObjectContainer) 
		{
			model = new ListModel(_data);
			model.addEventListener(ListModel.ListChange, onModelChange);
			
			view = new ListView();
			view.addEventListener(ListView.HeightOverflowEvent, onAddSlider);
			view.addEventListener(ListView.ListMoveEvent, onListMove);
			validate();
			p.addChild(view);
			view.setSize(Style.ListWidth, Style.ListHeight);
			
			
		}
		
		private function onListMove(e:Event):void 
		{
			slider.moveSlide(view.getPercent(),false);
		}
		
		private function onAddSlider(e:Event):void 
		{
			slider = new SliderController(view, 20, view.dispHeight);
			slider.addEventListener(SliderController.SliderMoveEvent, onSliderMove);
			trace(" slider controller = ");
		}
		
		private function onSliderMove(e:Event):void 
		{
			trace(" slider. = "  + slider.getButtonPosition());
			view.movePercent(slider.getButtonPosition(), false);
		}
		public function move(xx:Number, yy:Number):void
		{
			view.x = xx; view.y = yy;
		}
		private function onModelChange(e:Event):void 
		{
			validate();
		}
		
		private function validate():void
		{
			view.validateFromArray(model.data);
		}
	}

}