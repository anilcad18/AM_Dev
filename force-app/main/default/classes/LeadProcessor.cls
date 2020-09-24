global class LeadProcessor implements Database.Batchable <SObject>{
    //Start Method
	global Database.QueryLocator Start(Database.BatchableContext bc){
		String Query = 'Select Id, LeadSource from Lead';
		return Database.getQueryLocator(Query);
	}
	//Execute Method
	global void execute(Database.BatchableContext bc, List<Lead> Scope){
		if(Scope != null && !Scope.isEmpty()){
			for(Lead L : Scope){
				L.LeadSource = 'DreamForce';
			}
		update Scope;
	}
}
//Finish Method
global void finish(Database.BatchableContext bc) {
Id BatchId = bc.getJobId();
system.debug('BatchId::'+ BatchId);
}

}