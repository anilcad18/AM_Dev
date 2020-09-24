@isTest  
public class AccountProcessorTest {  
	public static testMethod void createAccount(){  
        Account acc = New Account();  
     	acc.Name = 'Test-Account';  
     	Insert acc;  
     	Contact con = New Contact();  
     	con.FirstName = 'Test-FirstName-Contact';  
     	con.LastName = 'Test-LastName-Contact';  
     	con.AccountId = acc.Id;  
     	Insert con;  
     	Set<Id> accId = new Set<Id>();  
     	accId.add(acc.Id);  
     	System.Test.startTest();  
        AccountProcessor.countContacts(accId);  
     	System.Test.stopTest();  
     	Account accList = [SELECT Number_of_Contacts__c FROM Account where id = : acc.Id LIMIT 1];  
     	System.assertEquals(accList.Number_of_Contacts__c, 1);  
   	}  
}