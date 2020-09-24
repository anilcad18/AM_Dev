public class PaymentBean {
    @AuraEnabled
    public string amount {get; set;}
    @AuraEnabled
    public string payment_instrument_id {get; set;}
    @AuraEnabled
    public string payment_method_id {get; set;}
    @AuraEnabled
    public string c_isCaptured {get; set;}
    @AuraEnabled
    public PaymentCards payment_card {get; set;}
    
    public class PaymentCards {
        @AuraEnabled
        public string card_type {get; set;}
        @AuraEnabled
        public string holder {get; set;}
    }
}