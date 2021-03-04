@isTest
public class testCreateAsUser {

    @isTest
    static void testAsUser(){
        User u = new User(
                            ProfileId = [SELECT Id FROM Profile WHERE Name = :'System Administrator'].Id,
                            UserRoleId = [SELECT Id FROM UserRole WHERE Name = :'CEO'].Id,
                            LastName = 'LastName',
                            Email = 'test@test.com',
                            Username = 'testuser@test.com.' + System.currentTimeMillis(),
                            CompanyName = 'TEST',
                            Title = 'title',
                            Alias = 'alias',
                            TimeZoneSidKey = 'America/Los_Angeles',
                            EmailEncodingKey = 'UTF-8',
                            LanguageLocaleKey = 'en_US',
                            LocaleSidKey = 'en_US'
                        );
        insert u;
        System.runAs(u){
            system.debug('**Current user:'+u);
            Account acc = new Account(Name = 'Test');
            insert acc;
            system.debug('*****Account RecordId created:'+acc.Id);
            system.debug('*****Account createdBy:'+acc.CreatedById + '\t' + acc.OwnerId);
            Account aa = [select Id, CreatedById, OwnerId from Account where Id =: acc.Id limit 1];
            system.debug('*****Account createdBy-2:'+aa.CreatedById + '\t' + aa.OwnerId);
        }
    }
}