public class TextTrimTrgCls {
    public static boolean runOnce = true;
    public TextTrimTrgCls(){
        system.debug('The size is '+trigger.size+' ****** Runonce '+runOnce);
        //runOnce = true;
        system.debug('The size is '+trigger.size+' ****** Runonce in Constructor'+runOnce);
    }
    public void onBeforeInsert(List<Text_Encrypted__c> newTxt){
        List<Text_Encrypted__c> txtList = new List<Text_Encrypted__c>();
        for(Text_Encrypted__c txt : newTxt){
            String s = txt.FirstName__c;
            String selectedVal = 'http://www.';
            s =s.replace(selectedVal,'');
            txt.FirstName__c=s;
            txtList.add(txt);
        }
        insert txtList;
        
        
//        String s = 'This is the year time';
//String selectedVal = 'year';
//s = s.replace(selectedVal,'');
    }
    public void onBeforeDelete(Map<Id,Text_Encrypted__c> oldMap){
    }
    public void onBeforeUpdate(Map<Id,Text_Encrypted__c> oldMap, Map<Id,Text_Encrypted__c> newMap){
    }
    public void onAfterInsert(Map<Id,Text_Encrypted__c> newMap){       
    }
    public void onAfterDelete(Map<Id,Text_Encrypted__c> oldMap){            
    }
    public void onAfterUpdate(Map<Id,Text_Encrypted__c> oldMap, Map<Id,Text_Encrypted__c> newMap){            
    }
    public void onAfterUndelete(Map<Id,Text_Encrypted__c> newMap){        
    }

}