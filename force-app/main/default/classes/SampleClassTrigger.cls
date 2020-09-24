public class SampleClassTrigger {
    public SampleClassTrigger(){}	//Constructor
    
    public void onBeforeInsert(List<Sample__c> newList){
        system.debug('Entered into onBeforeInsert()'+newList);
        
        system.debug('Leaving from onBeforeInsert()'+newList);        
    }
    public void onBeforeDelete(Map<Id,Sample__c> oldMap){
        system.debug('Entered into onBeforeDelete()'+oldMap);
        
        system.debug('Leaving from onBeforeDelete()'+oldMap);        
    }
    public void onBeforeUpdate(Map<Id,Sample__c> oldMap, Map<Id,Sample__c> newMap){
        system.debug('Entered into onBeforeUpdate()'+oldMap);
        system.debug('Entered into onBeforeUpdate()'+newMap);
        
        system.debug('Leaving from onBeforeUpdate()'+oldMap);        
        system.debug('Leaving from onBeforeUpdate()'+newMap);        
    }
    public void onAfterInsert(Map<Id,Sample__c> newMap){       
        system.debug('Entered into onAfterInsert()'+newMap);
        
        system.debug('Leaving from onAfterInsert()'+newMap);        
    }
    public void onAfterDelete(Map<Id,Sample__c> oldMap){            
        system.debug('Entered into onAfterDelete()'+oldMap);
        
        system.debug('Leaving from onAfterDelete()'+oldMap);        
    }
    public void onAfterUpdate(Map<Id,Sample__c> oldMap, Map<Id,Sample__c> newMap){            
        system.debug('Entered into onAfterUpdate()'+oldMap);
        system.debug('Entered into onAfterUpdate()'+newMap);
        
        system.debug('Leaving from onAfterUpdate()'+oldMap);        
        system.debug('Leaving from onAfterUpdate()'+newMap);        
    }
    public void onAfterUndelete(Map<Id,Sample__c> newMap){        
        system.debug('Entered into onAfterUndelete()'+newMap);
        
        system.debug('Leaving from onAfterUndelete()'+newMap);        
    }
}