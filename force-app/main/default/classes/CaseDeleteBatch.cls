global class CaseDeleteBatch implements Database.Batchable<sObject>, Database.Stateful {
	global String query;

	global Database.QueryLocator start(Database.BatchableContext bc) {
        this.query = getQuery();
		return Database.getQueryLocator(this.query);
	}
	
	global void execute(Database.BatchableContext bc, List<Case> scope) {
		delete scope;
	}

	global void finish(Database.BatchableContext bc) {
		//Send notification
        String s = 'anil@abc.com';//System.Label.Email_Salesforce_Team;
        List<String> toaddress = new List<string>{s};    
        String subject='Notification for Case Deletion';
        String body = 'Hello Salesforce Team,'
            +'<br/><br/>'
            +'Cases older than last ' + system.label.Case_Delete_LastNYears + ' has been deleted.'
            +'<br/><br/>'
            +'Thanks,'
            +'<br/>'
            +'Salesforce Team.'
            +'<br/>';
        Messaging.SingleEmailMessage relEmail = new Messaging.SingleEmailMessage();                     
        relEmail.setToAddresses(toaddress);           
        relEmail.setSenderDisplayName(UserInfo.getName());       
        relEmail.setSubject(subject);                        
        relEmail.setHtmlBody(body);     
        if(!test.isRunningTest()) {
            Messaging.SendEmailResult[] results = Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{relEmail}, true);
		}
	}
	
	private String getQuery() {
		this.query = 'Select Id from Case where CreatedDate < LAST_N_YEARS : ' + Integer.valueOf(system.label.Case_Delete_LastNYears);
        
        if(system.Test.isRunningTest())
            this.query = 'Select Id from Case LIMIT 15';
        return this.query;
	}
}