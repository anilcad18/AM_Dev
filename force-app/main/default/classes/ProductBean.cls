public class ProductBean {
    @AuraEnabled
    public String product_id {get; set;}
    @AuraEnabled
    public String product_name {get; set;}
    @AuraEnabled
    public String base_price {get; set;}
    @AuraEnabled
    public String quantity {get; set;}
    @AuraEnabled
    public String price {get; set;}
    @AuraEnabled
    public String price_after_order_discount {get; set;}
}