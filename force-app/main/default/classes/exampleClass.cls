public class exampleClass{
    Public Contact newCon {get;set;}
    public exampleClass(ApexPages.StandardController con){
       newCon = (Contact)con.getRecord();
    }
    public pagereference save(){
       Account a = New Account(Name = newCon.FirstName + ' ' + newCon.LastName);
       Insert a;
       newCon.AccountID = a.id;
       insert newCon;
       Pagereference pr = New PageReference('/' + a.id);
       return pr;
    }
}