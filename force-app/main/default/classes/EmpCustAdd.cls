public class EmpCustAdd {
    public Emp_1__c emp_1 {get; set;}

    public EmpCustAdd(){
        system.debug('******Entered into EmpCust() method**********');    
        if(emp_1 == null)
            emp_1 = new Emp_1__c();
        system.debug('******Leaving From EmpCust() method**********');    
    }
    public PageReference Save() {
        system.debug('******Entered into Save() method**********');    
        insert emp_1;
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
}