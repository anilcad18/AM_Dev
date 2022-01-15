/* Count the Number of Contacts available for each Account record and Update automatically on modification
    */
trigger ConCouTri on Contact (after insert, before delete, after Update) {
    system.debug('********* Entered into Trigger*************');
    List<Contact> conNewList = trigger.new;
    if(trigger.isAfter){
        Set<Id> accId = new Set<Id>();
        for(Contact con : conNewList){
            accId.add(con.AccountId);
        }
        system.debug('New AccountIds are'+accid);
        List<Account> accList = [select id,Name,Count1__c from Account where id in :accId];
        Map<Id, Account> accMap= new Map<Id, Account>();
        for(Account acc : accList){
            accMap.put(acc.Id, acc);
        }
        system.debug('Map contains'+accMap);
        for (Id str: accMap.keySet()) {
            Account val = accMap.get(str);
            system.debug('Count before update '+val);
            val.count1__c++;
            system.debug('Count after update '+val);
            accMap.put(str, val);
        }
        update accMap.values();
    }    
  
    system.debug('--Leaving from Trigger--');
}