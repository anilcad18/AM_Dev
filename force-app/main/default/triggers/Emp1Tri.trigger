trigger Emp1Tri on Emp_1__c (after insert, before delete) {
	system.debug('** Entered into Trigger**');
	List<Emp_1__c> empAddList = trigger.new;
    //system.debug(empaddlist);
    List<Employee__c> emps =[select Id,Name,Count1__c from Employee__c];
    if(trigger.isInsert){
		for(Employee__c emp : emps){
    		if(trigger.new[0].Employee__c==emp.Id){
              	emp.Count1__c++;
                //system.debug('Employee was :'+emp);
	        }
    	}
        update emps;
    }
    List<Emp_1__c> empAddOld = trigger.old;
    if(trigger.isDelete){
		for(Employee__c emp : emps){
    		if(trigger.old[0].Employee__c==emp.Id){
              	emp.Count1__c--;
                //system.debug('Employee was :'+emp);
	        }
    	}
        update emps;
    }

    system.debug('--Leaving from Trigger--');
}