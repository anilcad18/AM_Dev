public class OfferBean {
    @AuraEnabled
    public String offerId {get; set;}
    @AuraEnabled
    public String startDate {get; set;}
    @AuraEnabled
    public String descriptionEn {get; set;}
	@AuraEnabled
    public String descriptionFr {get; set;}
	@AuraEnabled
    public String endDate {get; set;}
    @AuraEnabled
	public String redeemed {get; set;}
    @AuraEnabled
    public String redeemedDate {get; set;}
}