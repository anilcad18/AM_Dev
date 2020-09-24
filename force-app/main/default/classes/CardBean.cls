public class CardBean {
    @AuraEnabled
	public String active {get; set;}
    @AuraEnabled
    public String accountId {get; set;}
    @AuraEnabled
    public String cardId {get; set;}
    @AuraEnabled
    public String activatedAtStore {get; set;}
    @AuraEnabled
    public String activatedByEmplId {get; set;}
}