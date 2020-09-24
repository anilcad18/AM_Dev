public with sharing class CollectionEg {
	public void listEg(){
        Account acc = new Account();
        Account[] act = new List<Account>();
        List<Account> accList1 = new List<Account>();
        Integer[] listInt = new List<Integer>(5);
        listInt[0] = 10;
        listInt[1] = 10;
        system.debug(listInt);
		/*system.debug('***** Entered into List()*****');
		
		List<Integer> listInt=new List<Integer>(5);
		listInt.add(10);
		listInt.add(20);
		listInt.add(30);
		listInt.add(40);
		listInt.add(null);
		system.debug('Values in List are '+listInt);
		system.debug('***** Leaving from List()*****');

        List<Employee__c> intList = new List<Employee__c>(10);
        Employee__c acc = intList.get(0);
        system.debug(acc.Name__c);
*/
        list<Employee__c> emps = [SELECT Name,Name__c FROM Employee__c LIMIT 1000];
		Employee__c e1 = new Employee__c();
		Employee__c e2 = new Employee__c();
		Employee__c e3 = new Employee__c();
		Employee__c e4 = new Employee__c();
		Employee__c e5 = new Employee__c();
		Employee__c e6 = new Employee__c();
		Employee__c e7 = new Employee__c();
		Employee__c e8 = new Employee__c();
		Employee__c e9 = new Employee__c();
        system.debug(emps);
        system.debug(emps.Size());
       // Integer[] emps1 = new List<Integer>();
       // for(Integer i=0; i<emps.size(); i++)
       // {
       //     system.debg(emps.get[i]);
      //  }
      for(Employee__c emp: emps)
      {
          system.debug('*********** Values are'+ emp.Name+'\t'+emp.Name__c);
      }
	}    
	
	public void setEg(){
		system.debug('***** Entered into Set()*****');
		
		Set<Integer> setInt=new Set<Integer>();
		setInt.add(10);
		setInt.add(20);
		setInt.add(20);
		setInt.add(10);
		setInt.add(null);
		setInt.add(null);
		system.debug('Values in Set are '+setInt);
		system.debug('***** Leaving from Set()*****');
	}
	
	public void mapEg(){
		/*system.debug('***** Entered into Map()*****');
		Map<String, String> egMap=new MAp<String, String>();
		egMap.put('IND','India');
		egMap.put('USA','United States');
		egMap.put('UK','United Kingdom');
		egMap.put('SIN','Singapore');
		
		system.debug('Values in Map are '+egMap);
		String val= egMap.get('IND');
		system.debug('value of IND is '+ val);
		system.debug('***** Leaving from Map()*****');
		
		*/
		
		
		Map<String, String> countryMap = new Map<String, String>();
		countryMap.put('IND', 'India');
		countryMap.put('US', 'United States');
		countryMap.put('CND', 'Canada');
		countryMap.put('USA', 'United States of America');
		
//		string val=countryMap.get('CNd');
//		system.debug('value of IND is '+ val);
		
        Set <String> keys = new Set<String>();
        keys=countryMap.keySet();
		system.debug('Keys are '+ keys);
		
        List <String> values = new List<String>();
        values=countryMap.values();
		system.debug('Values are '+ values);
        
        for (string str: keys) {
            String val = countryMap.get(str);
    		System.debug(str +' ==> '+ val);
		}	
	}
}