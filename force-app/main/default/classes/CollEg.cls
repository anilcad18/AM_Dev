public with sharing class CollEg {
	public void listEg(){
		system.debug('**********Entered Into Program*********');
        list<Employee__c> emps = [SELECT Name,Name__c, (select Employee__c,City__c from Emp_Addresses__r) FROM Employee__c LIMIT 1000];
		system.debug(emps);
        system.debug('Total no.of Records are: '+emps.size());
        list<Emp_1__c> adds =[select City__c,Employee__c from Emp_1__c];
      	for(Employee__c emp: emps)
      	{     
            Integer i=0;
            List<Emp_1__c> empAddList = emp.Emp_Addresses__r;
          	i=empAddList.size();
            system.debug('*** Record '+ emp.Name+'\t of '+emp.Name__c+'\t'+' has '+ i + '  addresses');
        	for(Emp_1__c add: empAddList){
                system.debug('***Address of emp: '+emp.Name__c+'\t' +' are '+add.City__c);
            }
			system.debug('\n');
        }
		system.debug('**********Leaving from Program*********');  
       
/*	    list<Employee__c> newEmp = new list<Employee__c>(10);
        String str ='aasdfghjkl1';
        string tech ='Java';
		newEmp[1].Name__c = str;
		newEmp[1].Technology__c = tech;
		insert newEmp[1];  
     
        list<Employee__c> newEmpList = new list<Employee__c>();
        system.debug('*****: ' + newEmpList);
        for(Integer i=0; i<3; i++){
            Employee__c emp = new Employee__c();
            system.debug('********* the emp: '+ emp);
            emp.Name__c = 'Anil-'+i;
            system.debug('********* the emp-2: '+ emp);
            //insert emp;
            newEmpList.add(emp);
            system.debug('********* the emp-3: '+ emp);
        }
        insert newEmpList;
        
        
        
      list<Employee__c> newEmpList = new list<Employee__c>();
        system.debug('*****: ' + newEmpList);
        for(Integer i=0; i<10; i++){
            Employee__c emp = new Employee__c();
            system.debug('********* the emp: '+ emp);
            emp.Name__c = 'Anil'; 
            insert emp;
        }
	*/
	}
}