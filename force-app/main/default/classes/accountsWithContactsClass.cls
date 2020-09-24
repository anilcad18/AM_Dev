public class accountsWithContactsClass {

@auraEnabled
public static list<account> getAllAccounts()
    {
       list<account> accs =[select id,name,phone,industry,(select lastName from contacts) from account];
      //  list<account> accs =[select id,name,phone,industry from account limit 10];
     //   return [select Id,Name from account limit 10];
     return accs;
    }
}