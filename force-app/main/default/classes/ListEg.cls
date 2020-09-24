public class ListEg {
	public void list1(){
		system.debug('***** Entered into List()*****');
		
		List<Integer> listInt=new List<Integer>(5);
		listInt.add(0, 10);
		listInt.add(1, 20);
		listInt.add(2, 30);
		listInt.add(40);
		listInt.add(null);
		system.debug('Values in List are '+listInt);
		system.debug('***** Leaving from List()*****');
	}
}