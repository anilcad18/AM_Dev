public class UserTestExtCnt {
    Public String spName {get;set;}
    Public Contact newCon {get;set;}
    private ApexPages.StandardController con;
    private Id recordId;
    
    public UserTestExtCnt(ApexPages.StandardController con){
        system.debug('********** Constructor-1: ' + con + '\n' + newCon);
        this.con = con; 
        newCon = (Contact)con.getRecord();
        system.debug('********** Constructor-2: ' + con + '\n' + newCon);
    }
    public PageReference save() {
        system.debug('********** save-1: ' + con + '\n' + newCon + '\n spName: '+ spName);
        con.save(); 
      	recordId = con.getId();
        newCon = [select id, UserName__c, UsName__c, User__c, User__r.Name, LastName from Contact where id=:recordId];
        spName = newCon.User__r.Name;
        //Contact temp = [select id, UserName__c, User__c, User__r.Name from Contact where id=:recordId];
        newCon.UserName__c = (String)newCon.User__r.Name;
        update newCon;
      	system.debug('***recordId' + recordId);
        system.debug('********** save-3: ' + con + '\n' + newCon + '\n spName: '+ spName);// + '\ntemp: '+ temp + '\n');
      	return savePageImage(recordId);
    }
    
    public PageReference savePageImage(Id recordId) {
        System.debug(system.LoggingLevel.Error,'in savePageImage()....get content as pdf...');
        system.debug('********** savePageImage-1: ' + con + '\n' + newCon + '\nrecordId: '+ recordId + '\n' + '\n spName: '+ spName);
        PageReference pagRef = new PageReference('/apex/UserTestPDF?id='+recordId);
        system.debug('********** savePageImage-2: ' + con + '\n' + newCon + '\n pagRef: '+ pagRef  + '\n spName: '+ spName);
        System.debug('**pagRef'+ pagRef);    
        system.debug('********** savePageImage-3: ' + con + '\n' + newCon + '\n pagRef: '+ pagRef  + '\n spName: '+ spName);
        Attachment att = new Attachment();
        att.Name = 'ImageOfCreditApplication.pdf';
        Blob blb;
        blb = pagRef.getContentAsPDF();
        String attStr = EncodingUtil.base64Encode(blb);
        system.debug('********** savePageImage-4: ' + attStr);
        //String s = EncodingUtil.base64Decode(attStr).toString();
        //system.debug('********** savePageImage-5: ' + s);
        att.body = blb;
        att.ParentId = recordId;
        insert att;  
        return NULL;
    }

}