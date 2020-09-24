public class ConClassTrigger {
    public ConClassTrigger(){}
    
    public void onBeforeInsert(List<Contact> newcon){
    }
    public void onBeforeDelete(Map<Id,Contact> oldConMap){
    }
    public void onBeforeUpdate(Map<Id,Contact> oldConMap, Map<Id,Contact> newConMap){
    }
    public void onAfterInsert(List<Contact> newCon){
        Set<Id> accId = new Set<Id>();
        for(Contact con : newCon){
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
    public void onAfterDelete(Map<Id,Contact> oldConMap){            
    }
    public void onAfterUpdate(Map<Id,Contact> oldConMap, Map<Id,Contact> newConMap){            
    }
    public void onAfterUndelete(Map<Id,Contact> newConMap){        
    }
}