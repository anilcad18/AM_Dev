public with sharing class CcCaseRespBean {
    @AuraEnabled
    public List<DataBean> orderList {get; set;}
    @AuraEnabled
    public String msg {get; set;}
}