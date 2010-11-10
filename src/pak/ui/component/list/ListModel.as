package pak.ui.component.list 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import mx.binding.utils.BindingUtils;
	import mx.binding.utils.ChangeWatcher;
	import mx.collections.ArrayCollection;
	import mx.events.CollectionEvent;
	import mx.events.PropertyChangeEvent;
	
	
	public class ListModel extends EventDispatcher
	{
		[Bindable] public var data:ArrayCollection;
		
		public static const ListChange:String = "listChangeEvent";
		
		public function ListModel(_data:ArrayCollection) 
		{
			data = _data;
			data.addEventListener(CollectionEvent.COLLECTION_CHANGE, onDataChange);
		}
				
		private function onDataChange(e:CollectionEvent):void 
		{
			trace(" datachange");
			dispatchEvent(new Event(ListModel.ListChange));
		}
	}

}