public class AccountProcessor{  
   @future  
   public static void countContacts(Set<Id> conId){  
     List<Account> accList = [SELECT ID, Name, Number_Of_Contacts__c, (SELECT ID From Contacts)FROM Account WHERE ID IN :conId];  
     for(Account acc : accList){  
       List<Contact> conList = acc.Contacts;  
       acc.Number_Of_Contacts__c = conList.Size();  
     }  
     update accList;  
   }  
}