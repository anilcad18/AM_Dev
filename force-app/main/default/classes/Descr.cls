public class Descr {
    public void cusDes(){
        system.debug('**********Entered Into Program*********');
        list<Employee__c> emps = [SELECT Name, Name__c, My_Description__c, (select Employee__c,City__c,State__c from Emp_Addresses__r) FROM Employee__c LIMIT 1000];
		for(Employee__c emp: emps)
      	{
            String str = emp.My_Description__c;
        	emp.My_Description__c=' ';
            //update emps;
    		List<Emp_1__c> empAddList = emp.Emp_Addresses__r;
          	for(Emp_1__c add: empAddList){
                str = emp.My_Description__c;
                String str1 = 'City  = ';
                String str2 = add.City__c;
                String str3 = add.State__c;
                str += '; '+str2+', '+str3+'; ';
                system.debug('***Address of emp: '+emp.Name__c+'\t' +' are '+add.City__c);
                /*emp.My_Description__c = str;
                update emps;*/
    			system.debug('Updated data'+emps);
            }
            emp.My_Description__c = str;
      	}
        update emps;
        system.debug('**********Leaving from Program*********');  
    }    

    public void stanDes(){
        system.debug('**********Entered Into Program*********');
        list<Account> accs = [SELECT Name, My_Description__c, (select FirstName,LastName from Contacts) FROM Account LIMIT 1000];
		for(Account acc: accs)
      	{
            String str;
        	List<Contact> accAddList = acc.Contacts;
          	for(Contact add: accAddList){
                str = acc.My_Description__c;
                String str1 = add.FirstName;
                String str2 = add.LastName;
                str = str+'FirstName = '+str1+';  '+' LastName = '+str2+'; ';
                system.debug('***Contacts of acc: '+acc.Name+'\t' +' are '+add.FirstName);
                acc.My_Description__c = str;
                update accs;
    			system.debug('Updated data'+accs);
            }
        }
        system.debug('**********Leaving from Program*********');  
    }    
}