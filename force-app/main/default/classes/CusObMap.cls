public class CusObMap {
    public void cusMap(){
        system.debug('**********Entered Into Program*********');
      //  list<Employee__c> emps = [SELECT Name,Name__c, (select Employee__c,City__c from Emp_Addresses__r) FROM Employee__c LIMIT 1000];
		List<Emp_1__c> addList = [select City__c,Employee__c from Emp_1__c];
		Map<Id, List<Emp_1__c>> empAddMap = new Map<Id, List<Emp_1__c>>();
        	for(Emp_1__c addr: addList){	
           		if(empAddMap.containskey(addr.Employee__c)){
                    List<Emp_1__c> addrList = empAddMap.get(addr.Employee__c);
                    addrList.add(addr);
                    system.debug(addr);
                    empAddMap.put(addr.Employee__c, addrList);
                }
                else{
                    List<Emp_1__c> addrList = new List<Emp_1__c>();
                    addrList.add(addr);
                    system.debug(addr);
                    empAddMap.put(addr.Employee__c, addrList);
                }
            }
        Set <Id> keys = new Set<Id>();
        keys=empAddMap.keySet();
		system.debug('Keys are '+ keys);
        for (string str: keys) {
	   		System.debug(str +' ==> '+empAddMap.get(str));
		}	
  		system.debug('**********Leaving from Program*********');  
    }

    public void stanMap(){
        system.debug('**********Entered Into Program*********');
        List<Contact> conList = [select FirstName,LastName,AccountId from Contact];
		Map<Id, List<Contact>> accAddMap = new Map<Id, List<Contact>>();
        	for(Contact cons: conList){	
           		if(accAddMap.containskey(cons.AccountId)){
                    List<Contact> consList = accAddMap.get(cons.AccountId);
                    consList.add(cons);
                    system.debug(cons);
                    accAddMap.put(cons.AccountId, conList);
                }
                else{
                    List<Contact> consList = accAddMap.get(cons.AccountId);
                    system.debug(cons);
                    consList.add(cons);
                    accAddMap.put(cons.AccountId, conList);
                }
            }
        Set <Id> keys = new Set<Id>();
        keys=accAddMap.keySet();
		system.debug('Keys are '+ keys);
        for (string str: keys) {
	   		System.debug(str +' ==> '+accAddMap.get(str));
		}	
  		system.debug('**********Leaving from Program*********');  
    }

}