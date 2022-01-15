trigger ConClassTri on Contact (before insert, before delete, before update, after insert, after delete, after update,after undelete) {
    system.debug('**********Entered Into Trigger***********');
    ConClassTrigger conTri = new ConClassTrigger();
    if(trigger.isBefore){
        system.debug('++++++++++ Entered into Before +++++++++');
        if(trigger.isInsert){
            system.debug('Now in Before Insert');
            conTri.onBeforeInsert(trigger.new);
        }
        if(trigger.isDelete){
            system.debug('Now in Before Delete');
            conTri.onBeforeDelete(trigger.oldMap);
        }
        if(trigger.isUpdate){
            system.debug('Now in Before Update');
            conTri.onBeforeUpdate(trigger.oldMap, trigger.newMap);
        }
    }
    if(trigger.isAfter){
        system.debug('+++++++Entered into After+++++++++');
        if(trigger.isInsert){
            system.debug('Now in After Insert');
            conTri.onAfterInsert(trigger.new);
        }
        if(trigger.isDelete){
            system.debug('Now in After Delete');
            conTri.onAfterDelete(trigger.oldMap);
        }
        if(trigger.isUpdate){
            system.debug('Now in After Update');
            conTri.onAfterUpdate(trigger.oldMap, trigger.newMap);
        }
        if(trigger.isUndelete){
            system.debug('Now in After Undelete');
            contri.onAfterUndelete(trigger.newMap);
        }
    }
    system.debug('*********Leaving from Trigger*********');
}