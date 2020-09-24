@isTest
private class TestCase {
    @testSetup static void setup() {
        // Create common test accounts
        List<Account> accList = new List<Account>();
        for(Integer i=0; i<20; i++) {
            accList.add(new Account(Name='TestAcct'+i));
        }
        insert accList;
        
        List<Contact> conList = new List<Contact>();
        for(Integer i=0; i<20; i++) {
            conList.add(new Contact(FirstName='TestAcct'+i, LastName='LastName'+i, AccountId=accList[i].Id));
        }
        insert conList;
        
        List<Case> caseList = new List<Case>();
        for(Integer i=0; i<20; i++) {
            caseList.add(new Case(AccountId=accList[i].Id, ContactId=conList[i].Id));//tODO: Add Status
        }
        insert caseList;
    }
    
    @isTest static void caseSch() {
        List<Case> caseList = [Select Id from Case];
        String CRON_EXP = '0 0 0 15 3 ? *';
        Test.startTest();
        String jobId = System.schedule('ScheduledApexTest', CRON_EXP, new CaseDeleteBatchSch());
        Test.stopTest();
        
    }

    /*@isTest static void caseBatch() {
        Test.startTest();
        DataBase.executeBatch(new CaseDeleteBatch());
        Test.stopTest();
    }*/

}