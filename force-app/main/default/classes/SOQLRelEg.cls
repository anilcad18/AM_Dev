public class SOQLRelEg {
    public void parent2Child(){
        system.debug('Entered Into Parent2Child()');
        //Standard Object
        List<Account> accList = [Select Name, Phone, (Select Name from Contacts) from Account];
        for(Account a: AccList){
            System.debug('Account Name :'+a.Name+'a.Phone :'+a.Phone);
            List<Contact> con = a.Contacts;
            for(Contact c: con){
                system.debug('FirstName '+c.FirstName+'\tLastName '+c.LastName);
            }
        }
        //Custom Object
        
        system.debug('Leaving from Parent2Child()');
    }
    public void Child2Parent(){
        //Standard Objects
        List<Contact> conList = [SELECT Name, Phone, Account.Name from Contact];
        for(Contact c: ConList){
            system.debug('Name'+c.Name+'\tAccount Name'+c.Account.name);
        }
        //Custom Objects
        List<Emp_1__c> emp1List =[Select city__c,State__c, Employee__r.Name from Emp_1__c];
        for(Emp_1__c e1: emp1List){
            system.debug('Name'+e1.city__c+'\tEmployee Name'+e1.Employee__r.Name);
        }
    }

}