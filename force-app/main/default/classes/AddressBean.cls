public class AddressBean {
    @AuraEnabled
    public String full_name {get; set;}
    @AuraEnabled
    public String phone {get; set;}
    @AuraEnabled
	public String address1 {get; set;}
    @AuraEnabled
    public String city {get; set;}
    @AuraEnabled
    public String state_code {get; set;}
    @AuraEnabled
    public String postal_code {get; set;}
    @AuraEnabled
    public String country_code {get; set;}
}