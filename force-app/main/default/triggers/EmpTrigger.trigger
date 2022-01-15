trigger EmpTrigger on Employee__c (before insert, after insert) {
    system.debug('** Entered into program**');
    List<Employee__c> empList = trigger.new;
            //Employee__c emp = trigger.new[0];
    system.debug('+++++++'+empList);
    if(trigger.isInsert && trigger.isBefore)
        for(Employee__c emp : empList){
            emp.Active__c= false;
            emp.addError('<a href=\'https://www.google.com\' target="_blank">Google</a>', false);
        }    
    system.debug('------'+empList);
    system.debug('--Leaving from Program--');
}