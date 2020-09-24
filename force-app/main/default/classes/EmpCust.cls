public with sharing class EmpCust {
    public Employee__c emp {get; set;}

    public EmpCust(){
        system.debug('******Entered into EmpCust() method**********');    
        if(emp == null)
            emp = new Employee__c();
        system.debug('******Leaving From EmpCust() method**********');    
    }
    public PageReference Save() {
        system.debug('******Entered into Save() method**********');    
        insert emp;
        system.debug('******Leaving from Save() method**********');    
        return null;
    }
    public PageReference Cancel() {
        system.debug('******Entered into Cancel() method**********');    
        PageReference page = new PageReference('/apex/EmpCustVF');
        page.setRedirect(true);
        system.debug('******Leaving from Cancel() method**********');    
        return page;
    }
    public PageReference NewAddress() {
        save();
        system.debug('******Entered into NewAddress() method**********');    
        PageReference page = new PageReference('/apex/EmpAddVF');
        page.setRedirect(true);
        system.debug('******Leaving from NewAddress() method**********');    
        return page;
    }
}