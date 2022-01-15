/**
 * @description       : 
 * @author            : Anil Mannem
 * @last modified on  : 04-06-2021
 * @last modified by  : Anil Mannem
 * Modifications Log 
 * Ver   Date         Author        Modification
 * 1.0   04-06-2021   Anil Mannem   Initial Version
**/ 
public Class AccountBean {
    @AuraEnabled
    public String AccountId {get; set;}
    @AuraEnabled
    public List<CardBean> cards {get; set;}
    @AuraEnabled
	public List<OfferBean> offers {get; set;}
    @AuraEnabled
    public List<ProgramBean> programs {get; set;}
    @AuraEnabled
    public String msg {get; set;}
}