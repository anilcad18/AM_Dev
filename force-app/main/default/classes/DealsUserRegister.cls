public with sharing class DealsUserRegister {
	@AuraEnabled
    public static void createRecord (DealUser__c duser){
        try{
            System.debug('Created DealUser Record:-'+duser);
            if(duser != null){
                insert duser;
            }
        } catch (Exception ex){}
    }    
}