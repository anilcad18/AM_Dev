global class CaseDeleteBatchSch implements Schedulable {
	global void execute(SchedulableContext sc) {
		Database.executebatch(new CaseDeleteBatch(), 200);
    }
}