public class DataBean {
    @AuraEnabled
    public string order_no {get; set;}
    @AuraEnabled
    public string customer_name {get; set;}
    @AuraEnabled
    public string creation_date {get; set;}
    @AuraEnabled
    public string status {get; set;}
    @AuraEnabled
    public string site_id {get; set;}
    @AuraEnabled
    public string order_total {get; set;}
    @AuraEnabled
    public string tax_total {get; set;}
    @AuraEnabled
    public string c_GST {get; set;}
    @AuraEnabled
    public string c_QST {get; set;}
    @AuraEnabled
    public string product_sub_total {get; set;}
    @AuraEnabled
    public string product_total {get; set;}
    @AuraEnabled
    public string shipping_total {get; set;}
    @AuraEnabled
    public string shipping_total_tax {get; set;}
    @AuraEnabled
    public string shipping_status {get; set;}
    @AuraEnabled
    public string export_status {get; set;}
    @AuraEnabled
    public string payment_status {get; set;}
    @AuraEnabled
    public List<PaymentBean> payment_instruments {get; set;}
    @AuraEnabled
    public List<ProductBean> product_items {get; set;}
    @AuraEnabled
    public AddressBean billing_address {get; set;}
    @AuraEnabled 
    public List<ShipmentBean> shipments {get; set;}

    public class ShipmentBean {
        @AuraEnabled
        public AddressBean shipping_address {get; set;}
    }
}