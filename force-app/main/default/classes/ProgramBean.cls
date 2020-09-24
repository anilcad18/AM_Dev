public class ProgramBean {
    @AuraEnabled
	public String status {get; set;}
    @AuraEnabled
    public String startDate {get; set;}
    @AuraEnabled
    public String programId {get; set;}
    @AuraEnabled
    public String endDate {get; set;}
}