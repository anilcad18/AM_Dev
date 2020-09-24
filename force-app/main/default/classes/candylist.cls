public class candylist {
	public Map<id,account> accmap{get;set;}
	public void candylist(){
		map<id,account>accmap = new map<id,account>([select id,name from account]);
		for(id key:accmap.keyset()){
			account a=accmap.get(key);
            system.debug(a);
		}
	}
}