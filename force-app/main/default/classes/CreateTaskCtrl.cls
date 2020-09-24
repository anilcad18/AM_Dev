public class CreateTaskCtrl {
    public Task tsk {get; set;}
    public String retURL = ApexPages.currentPage().getParameters().get('retURL');
    public Boolean displayAccount {get; set;}
    
    public CreateTaskCtrl(){
        if(tsk == null){
            tsk = new Task();
            string strWhatId = ApexPages.currentPage().getParameters().get('WhatId');
      		string strOwnerId = ApexPages.currentPage().getParameters().get('OwnerId');
      		string strWhoId = ApexPages.currentPage().getParameters().get('WhoId');
            if(strWhatId != NULL){
                tsk.WhatId = strWhatId ;
            }
            if(strWhoId!= NULL){
	            tsk.WhoId = strWhoId;
            }
            if(strOwnerId != NULL){
	      		tsk.OwnerId = strOwnerId ;
            }
    //        tsk.Status = 'Active';
    //        tsk.Subject = 'Email';
    //        tsk.ActivityDate = System.Today();
        }
    }
    public Boolean checkName(){
        String strWhoId = tsk.WhoId;
        Contact con =[SELECT id from Contact WHERE ID =: strWhoId];
        Lead led = [SELECT Id from Lead WHERE ID =: strWhoId];
        if(con.Id != NULL){
            return true;
        }
        if(led.Id != NULL){
            return false;
        }
        return true;
    }
    public PageReference Save() {
        system.debug('******Entered into Save() method**********');    
        insert tsk;
        PageReference page;
        if(retURL != NULL){
            page = new PageReference(retURL);
            return page;
        }
        system.debug('******Leaving from Save() method**********');    
        return null;
    }
    public PageReference Cancel() {
        system.debug('******Entered into Cancel() method**********');    
        system.debug('******Leaving from Cancel() method**********');    
        return null;
    }    
}