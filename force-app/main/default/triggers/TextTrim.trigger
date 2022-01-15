trigger TextTrim on Text_Encrypted__c (before insert) {
	TextTrimTrgCls TriCls = new TextTrimTrgCls();
    if(Trigger.isInsert){
       TriCls.onBeforeInsert(trigger.new);
    }
}