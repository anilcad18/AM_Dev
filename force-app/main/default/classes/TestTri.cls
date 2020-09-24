public class TestTri {
    public void ins(){
    	list<Text_Encrypted__c> texts = new List<Text_Encrypted__c>();
        for(Integer i=1;i<=1;i++){
	    	Text_Encrypted__c t = new Text_Encrypted__c(FirstName__c='C '+i);
	    	texts.add(t);
        }
        insert texts;
    }
    public void del(){
       List<Text_Encrypted__c> t = [select Id,Name from Text_Encrypted__c where FirstName__c Like 'C%' ];
       system.debug('Record was '+t);
       delete t;
    }    
    public void updateAcc(){	
    	Text_Encrypted__c textToUpdate =[select FirstName__c from Text_Encrypted__c where  FirstName__c='C 1'];
    	textToUpdate.FirstName__C= 'C_1';
    	update textToUpdate;
    	system.debug('Updated data');
    }
}