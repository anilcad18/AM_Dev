trigger TestTri on Text_Encrypted__c (before insert, before delete, before update, after insert, after delete, after update,after undelete) {
	List<Text_Encrypted__c> testNew = trigger.new;
    Map<Id,Text_Encrypted__c> testNewMap = trigger.newMap;
    List<Text_Encrypted__c> testOld = trigger.old;
    Map<Id,Text_Encrypted__c> testOldMap = trigger.oldMap;
    system.debug('*************Now in Before************');
    if(trigger.isBefore){
        if(trigger.isInsert){
            system.debug('Before Insert');
            system.debug(testNew);
            system.debug(testNewMap);
            system.debug(testOld);
            system.debug(testOldMap);
        }
        if(trigger.isDelete){
            system.debug('Before Delete');
            system.debug(testNew);
            system.debug(testNewMap);
            system.debug(testOld);
            system.debug(testOldMap);
        }
        if(trigger.isUpdate){
            system.debug('Before Update');
            system.debug(testNew);
            system.debug(testNewMap);
            system.debug(testOld);
            system.debug(testOldMap);
        }
    }
    system.debug('+++++++++++++++++Now in After++++++++++++++++++');
    if(trigger.isAfter){
        if(trigger.isInsert){
            system.debug('After Insert');
            system.debug(testNew);
            system.debug(testNewMap);
            system.debug(testOld);
            system.debug(testOldMap);
        }
        if(trigger.isDelete){
            system.debug('After Delete');
            system.debug(testNew);
            system.debug(testNewMap);
            system.debug(testOld);
            system.debug(testOldMap);
        }
        if(trigger.isUpdate){
            system.debug('After Update');
            system.debug(testNew);
            system.debug(testNewMap);
            system.debug(testOld);
            system.debug(testOldMap);
        }
        if(trigger.isUndelete){
            system.debug('After Undelete');
            system.debug(testNew);
            system.debug(testNewMap);
            system.debug(testOld);
            system.debug(testOldMap);
        }
    }
}