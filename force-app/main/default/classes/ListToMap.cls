//Converting from List to Map even for 200 records
//
public class ListToMap {
    public void test(){
        List<Account> accList = [select id,Name from Account];
        Map<Id, Account> accMap= new Map<Id, Account>();
        //Map<Id, Account> accMapNew = new Map<Id, Account>([select Id,Name from Account]);
        for(Account acc : accList){
            accMap.put(acc.Id, acc);
        }
        system.debug(accList);
        System.debug('****************');
        system.debug(accMap);
        //System.debug('****************');
        //system.debug(accMapNew);
        Set <id> keys = new Set<id>();
        keys=accMap.keySet();
		system.debug('Keys are '+ keys);
		List <Account> values = new List<Account>();
        values=accMap.values();
		system.debug('Values are '+ values);
        for (Id str: keys) {
            Account val = accMap.get(str);
    		System.debug(str +' ==> '+ val);
		}	
    }
}