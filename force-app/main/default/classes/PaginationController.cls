public class PaginationController{
    Public Integer size{get;set;}           //To select number of records to display
    public Integer noOfAcc{get; set;}
    Public Integer noOfCon{get; set;}
    public Integer noOfLead{get; set;}
    public String str {get; set;}
    public String find = ApexPages.currentPage().getParameters().get('phoneNumber');
    public ApexPages.StandardSetController setCon1 {get; set;}
    public ApexPages.StandardSetController setCon2 {get; set;}
    public ApexPages.StandardSetController setCon3 {get; set;}
    public string selectedContact {get;set;}    

    public PaginationController(){
        size=3;
        noOfAcc= 0;
        noOfCon = 0;
        noOfLead = 0;
        if(find != null){
            str = find;
            search();
        }
    }
    public PageReference Search() {
        PageReference page;
        if(str != null && (str).trim() !='' ) {
            setCon1 = new ApexPages.StandardSetController(Database.getQueryLocator(
                      [Select name ,id, phone, Owner.Name from Account where Phone1__c =: str]));
            setCon1.setPageSize(size);  
            noOfAcc = setCon1.getResultSize();
            setCon2 = new ApexPages.StandardSetController(Database.getQueryLocator(
                      [Select id,FirstName, LastName, AccountId, Email, Phone, Owner.Name from Contact where Phone1__c =: str]));
            setCon2.setPageSize(size);  
            noOfCon = setCon2.getResultSize();
            setCon3 = new ApexPages.StandardSetController(Database.getQueryLocator(
                      [Select Name, Company, Email, Phone,Owner.Name from Lead where Phone1__c =: str]));
            setCon3.setPageSize(size);
            noOfLead = setCon3.getResultSize();
            
        }
        if(noOfAcc==0 && noOfCon==0 && noOfLead==0){
            page =  newTask();
            return page;
        }
        if((noOfAcc + noOfCon + noOfLead) == 1){
            if(noOfAcc == 1){
                List<Account> acc = setCon1.getRecords();
                for(Account a : acc){
                    page = new PageReference('/apex/CreateTask?WhatId='+a.Id+'&OwnerId='+a.OwnerId+'&retURL='+a.id);
                    return page;
                }
            }
            else if(noOfCon == 1){
                List<Contact> con = setCon2.getRecords();
                for(Contact c : con){
                    if(c.AccountId != null){
                        page = new PageReference('/apex/CreateTask?WhoId='+c.Id+'&OwnerId='+c.OwnerId+'&WhatId='+c.AccountId+'&retURL='+c.id);
                        return page;
                    }
                    else{
                        page = new PageReference('/apex/CreateTask?WhoId='+c.Id+'&OwnerId='+c.OwnerId+'&retURL='+c.id);
                        return page;
                    }
                }
            }
            else if(noOfLead == 1){
                List<Lead> led = setCon3.getRecords();
                  for(Lead l: led){
                    page = new PageReference('/apex/CreateTask?WhoId='+l.Id+'&OwnerId='+l.OwnerId+'&retURL='+lead.id);
                    return page;
                  }
             }
        }        
        return null;
     }

    public List<Account> getAccounts() {
         return (List<Account>) setCon1.getRecords();
    }
    public List<Contact> getContacts() {
         return (List<Contact>) setCon2.getRecords();
    }
    public List<Lead> getLeads() {
         return (List<Lead>) setCon3.getRecords();
    }

    public PageReference newTask(){
        PageReference page = new PageReference('/apex/CreateTask');
        return page;
    }
    
    public PageReference contactClicked() {
        Contact c = [SELECT Id, LastName, AccountId, Owner.Name from Contact WHERE ID =: selectedContact];
        PageReference page;
        if(c.AccountId != null){
            page = new PageReference('/apex/CreateTask?WhoId='+c.Id+'&OwnerId='+c.OwnerId+'&WhatId='+c.AccountId+'&retURL='+c.Id);
            return page;
        }
        else{
            page = new PageReference('/apex/CreateTask?WhoId='+c.Id+'&OwnerId='+c.OwnerId+'&retURL='+c.Id);
            return page;
        }
    }
}