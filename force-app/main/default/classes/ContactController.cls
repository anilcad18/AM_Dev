public with sharing class ContactController {
    @AuraEnabled
    public static List<Contact> findAll(){
        return [select id, name, phone from Contact];
    }
    @AuraEnabled
    public static List<Contact> findByName(String searchKey){
        String name = '%'+searchKey+'%';
        return [select id, name, phone, Account.Name from contact where name Like:name];
    }
    @AuraEnabled
    public static Contact findById(String ContactId){
        return [select id, name, phone, Account.Name from Contact where id=:ContactId];
    }
}