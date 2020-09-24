public class MultiListExtCnt {
    public List<Account> accList {get; set;}
    public List<Contact> conList {get; set;}
    public Account acc {get; set;}
    public ApexPages.StandardSetController con{get; set;} 
    
    public MultiListExtCnt(Apexpages.StandardController std){
        getAccounts();
        getContacts();
    }
    
    public List<Account> getAccounts(){
        String qry = 'Select Name, Phone, Fax from Account where Phone like acc.Phone';
        accList = Database.query(qry);
        return accList;
    }
    
    public List<Contact> getContacts(){
        String qry = 'Select FirstName, LastName from Contact';
        conList = Database.query(qry);
        return conList;
    }
    public PageReference Search()
    {
        String query= '';
        String strFilter = '';
        if(acc.Name != null && (acc.Name ).trim() !='')
        {
           strFilter  = strFilter  +  ' where Name Like \''+acc.Name+'%\'' ;
        }
        if(acc.Phone != null && (acc.Phone).trim() !='' )
        {
           if(strFilter == '')
           { 
               strFilter  = strFilter  +  ' where Phone like \''+acc.Phone+'%\'' ;
           }
           else
           {
               strFilter  = strFilter  +  ' And Phone like \''+acc.Phone+'%\'' ;
           }
        }
        if(strFilter != '')
        {
            getAccounts();
        }
        else
        {
        }
       return null;
    }
}