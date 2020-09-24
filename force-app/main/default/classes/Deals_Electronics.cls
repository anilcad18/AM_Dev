public with sharing class Deals_Electronics {
	@AuraEnabled
	public static List<Electronics__c> Deals_Electronics(){
       return [SELECT Id, Name__c, Brand__c, Category__c, Original_Price__c, Deal_Price__c, Description__c, Deal_Till__c, Deal_URL__c from Electronics__c];
	}
}