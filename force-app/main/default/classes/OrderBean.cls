public class OrderBean {
    @AuraEnabled
    public List<HitsBean> hits{get; set;}
    @AuraEnabled
    public String msg {get; set;}
}