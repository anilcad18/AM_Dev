//Create contact for each account record instantly

trigger AccConTri on Account (before insert, after insert) {
    AccClassTrigger.runOnce = true;
    AccClassTrigger accTri = new AccClassTrigger();
    if(trigger.isAfter){
       accTri.onAfterInsert(trigger.new);
       //addError('Testing addError Method');
    }
}