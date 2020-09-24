public with sharing class CustomPaginationController 
{
    public Account acc {get;set;}
    public Contact conList {get; set;}
    public Lead leadList {get; set;}
    public ApexPages.StandardSetController con{get; set;} 
    public ApexPages.StandardSetController con1{get; set;} 
    public ApexPages.StandardSetController con2{get; set;} 
    public String find = ApexPages.currentPage().getParameters().get('phoneNumber');
    public String str {get; set;}
    Public Integer size{get;set;} 
    Public Integer noOfRecords{get; set;} 
  
   public CustomPaginationController() {
        acc = new Account();
        lstAccount = new List<Account>();
        conList = new Contact();
        lstContact = new List<Contact>();
        leadList = new Lead();
        lstLead = new List<Lead>();
        if(find != null){
            str = find;
            Search();
        }//To get the number of records to be displayed
        size=2;
    }

    public List<Account> lstAccount {  
        get{  
            if(con != null) 
                return (List<Account>)con.getRecords();
            else  
                return null ;  
        }  
        set;
    }  
    public List<Contact> lstContact {  
        get {  
            if(con1 != null)
                return (List<Contact>)con1.getRecords();
            else  
                return null ;  
        }  
        set;
    }
    public List<Lead> lstLead{
        get{
            if(con2 != null) 
                return (List<lead>)con2.getRecords();
            else  
                return null ;  
        }  
        set;
    }  

    public PageReference Search() {
        if(str != null && (str).trim() !='' ) {
            con = new ApexPages.StandardSetController(Database.getQueryLocator(
                  [Select name ,id, phone, Owner.Name from Account where Phone1__c =: str])); 
            con.setPageSize(size);
            con1 = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [Select id,FirstName, LastName, AccountId, Email, Phone, Owner.Name from Contact where Phone1__c =: str]));
            con1.setPageSize(size);
            con2 = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [Select Name, Company, Email, Phone,Owner.Name from Lead where Phone1__c =: str]));
            con2.setPageSize(size);
        }
        else {
        }
       return null;
    }
}