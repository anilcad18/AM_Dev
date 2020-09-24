public with sharing class EmpAddExt {

    public EmpAddExt(ApexPages.StandardController controller) {
        system.debug('******Entered into EmpAddExt() method**********');    
        if(empAdd == null)
            empAdd = new Emp_1__c();
        system.debug('******Leaving From EmpAddExt() method**********');    

    }
    public Emp_1__c empAdd {get; set;}
    
    public PageReference Previous() {
        system.debug('******Entered into Previous() method**********');    
        PageReference page = new PageReference('/apex/EmpExtVF');
        page.setRedirect(true);
        system.debug('******Leaving from Previous() method**********');    
        return page;
    }
}