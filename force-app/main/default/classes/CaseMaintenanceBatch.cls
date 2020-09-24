global class CaseMaintenanceBatch implements Database.Batchable<sObject>, Database.Stateful {
	global String query;

    global Database.QueryLocator start(Database.BatchableContext bc) {
        this.query = getQuery();
        return Database.getQueryLocator(this.query);
    }

    global void execute(Database.BatchableContext bc, List<Case> scope) {
        delete scope;
	}

    global void finish(Database.BatchableContext bc) {   
    }


    private String getQuery() {
        this.query = 'Select Id, Status from Case where Status = \'Closed\' LastModifiedDate < LAST_N_MONTHS : ' + 
            Integer.valueOf(System.Label.Case_Delete_LastNMonths);
        
        if(system.Test.isRunningTest()) {
			this.query = 'Select Id from Case LIMIT 15';
        }
        return this.query;
    }
}