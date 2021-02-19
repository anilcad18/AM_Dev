/**
 * @description Test Class for OMNI_BatchManagerTree.
 * @author      Anil Mannem
 * @date        25-Jan-2021
 */
@isTest
public class OMNI_BatchManagerTreeTest {
    // @TestSetup
    // static void makeData(){
    //     User employee = TestDataFactory.createrUserWithProfile('System Administrator');
    //     employee.EmployeeID__c = 'xx720274';
    //     employee.Manager_Tree__c = '';
    //     employee.Manager_Tree_Last_Updated__c = null; 
    //     update employee;

    //     User ceo = TestDataFactory.createrUserWithProfile('System Administrator');
    //     ceo.EmployeeID__c = 'xx720276';
    //     ceo.Manager_Tree__c = '';
    //     ceo.Manager_Tree_Last_Updated__c = null;
    //     update ceo; 
    // }

    // @isTest
    // static void test_ManagerTreeBatchSuccessfulScenario() {
    //     System.Test.startTest();
    //     String managerTreeResponse ='{"trackingNumber":"",'+
    //                                 '"requestTime":"2021-01-20T09:40:19.096",'+
    //                                 '"processingTime":"1721",'+
    //                                 '"employeeManagerTree":'+
    //                                     '[{"employeeID":"xx720274","supervisorID":"xx720275"},'+
    //                                     '{"employeeID":"xx720275","supervisorID":"xx720276"},'+
    //                                     '{"employeeID":"xx720276","supervisorID": null}]}';
    //     String authResponse = '{"access_token":"ojOfXB26k6YVjwvc5lfE","token_type":"bearer"}';
    //     Test.setMock(HttpCalloutMock.class, new OMNI_ManagerTreeCalloutMock(200, 'Success', authResponse, managerTreeResponse));
    //     OMNI_BatchManagerTree batch = new OMNI_BatchManagerTree();
    //     Database.executeBatch(batch);  
    //     System.Test.stopTest();

    //     User employee = [SELECT Id, Name, EmployeeID__c, Manager_Tree__c, Manager_Tree_Last_Updated__c FROM User WHERE EmployeeID__c = 'xx720274'];
    //     System.assertEquals('xx720274', employee.EmployeeID__c, 'The employee Id should not have changed');
    //     System.assertEquals(',xx720274,xx720275,xx720276,', employee.Manager_Tree__c, 'The employee manager tree was not correctly updated');
    //     System.assertNotEquals(null, employee.Manager_Tree_Last_Updated__c, 'The employees Manager Tree Updated Time should not be null');

    //     User ceo = [SELECT Id, Name, EmployeeID__c, Manager_Tree__c, Manager_Tree_Last_Updated__c FROM User WHERE EmployeeID__c = 'xx720276'];
    //     System.assertEquals('xx720276', ceo.EmployeeID__c, 'The CEO Id should noty have changed');
    //     System.assertEquals(',xx720276,', ceo.Manager_Tree__c, 'The CEO manager tree was not correctly updated');
    //     System.assertNotEquals(null, ceo.Manager_Tree_Last_Updated__c, 'The CEO Manager Tree Updated Time should not be null');
    // }
   
    // @isTest
    // static void test_ManagerTreeBatchInfiniteLoop() {
    //     System.Test.startTest();
    //     String managerTreeResponse ='{"trackingNumber":"Martin-343242-423423-44rtffrd346",'+
    //                                 '"requestTime":"2021-01-20T09:40:19.096",'+
    //                                 '"processingTime":"1721",'+
    //                                 '"employeeManagerTree":'+
    //                                     '[{"employeeID":"xx720274","supervisorID":"xx720275"},'+
    //                                     '{"employeeID":"xx720275","supervisorID":"xx720276"},'+
    //                                     '{"employeeID":"xx720276","supervisorID":"xx720275"},'+
    //                                     '{"employeeID":"xx720277","supervisorID":null}]}';
    //     String authResponse = '{"access_token":"ojOfXB26k6YVjwvc5lfE","token_type":"bearer"}';
    //     Test.setMock(HttpCalloutMock.class, new OMNI_ManagerTreeCalloutMock(200, 'Success', authResponse, managerTreeResponse));
    //     OMNI_BatchManagerTree batch = new OMNI_BatchManagerTree();
    //     Database.executeBatch(batch);
    //     System.Test.stopTest();

    //     User employee = [SELECT Id, Name, EmployeeID__c, Manager_Tree__c, Manager_Tree_Last_Updated__c FROM User WHERE EmployeeID__c = 'xx720274'];
    //     System.assertEquals('xx720274', employee.EmployeeID__c, 'The employee Id should noty have changed');
    //     System.assert(String.isBlank(employee.Manager_Tree__c), 'The employee manager tree should not have been updated');
    //     System.assertEquals(null, employee.Manager_Tree_Last_Updated__c, 'The employees Manager Tree Updated Time should not have been updated');
    // }

    // @isTest   
    // static void test_ManagerTreeBatchManagerNotFoundInMap() {
    //     System.Test.startTest();
    //     String managerTreeResponse ='{"trackingNumber":"Martin-343242-423423-44rtffrd346",'+
    //                                 '"requestTime":"2021-01-20T09:40:19.096",'+
    //                                 '"processingTime":"1721",'+
    //                                 '"employeeManagerTree":'+
    //                                     '[{"employeeID":"xx720274","supervisorID":"xx720275"},'+
    //                                     '{"employeeID":"xx720275","supervisorID":"xx720276"},'+
    //                                     '{"employeeID":"xx720277","supervisorID":""}]}';
    //     String authResponse = '{"access_token":"ojOfXB26k6YVjwvc5lfE","token_type":"bearer"}';
    //     Test.setMock(HttpCalloutMock.class, new OMNI_ManagerTreeCalloutMock(200, 'Success', authResponse, managerTreeResponse));
    //     OMNI_BatchManagerTree batch = new OMNI_BatchManagerTree();
    //     Database.executeBatch(batch);
    //     System.Test.stopTest();

    //     User employee = [SELECT Id, Name, EmployeeID__c, Manager_Tree__c, Manager_Tree_Last_Updated__c FROM User WHERE EmployeeID__c = 'xx720274'];
    //     System.assertEquals('xx720274', employee.EmployeeID__c, 'The employee Id should noty have changed');
    //     System.assert(String.isBlank(employee.Manager_Tree__c), 'The employee manager tree should not have been updated');
    //     System.assertEquals(null, employee.Manager_Tree_Last_Updated__c, 'The employees Manager Tree Updated Time should not have been updated');
    // }

    // @isTest   
    // static void test_ManagerTreeBatchApiError() {
    //     System.Test.startTest();
    //     String managerTreeResponse = '{}';
    //     String authResponse = '{}';
    //     Test.setMock(HttpCalloutMock.class, new OMNI_ManagerTreeCalloutMock(400, 'Bad Request', authResponse, managerTreeResponse));
    //     OMNI_BatchManagerTree batch = new OMNI_BatchManagerTree();
    //     Database.executeBatch(batch);
    //     System.Test.stopTest();
        
    //     User employee = [SELECT Id, Name, EmployeeID__c, Manager_Tree__c, Manager_Tree_Last_Updated__c FROM User WHERE EmployeeID__c = 'xx720274'];
    //     System.assertEquals('xx720274', employee.EmployeeID__c, 'The employee Id should noty have changed');
    //     System.assert(String.isBlank(employee.Manager_Tree__c), 'The employee manager tree should not have been updated');
    //     System.assertEquals(null, employee.Manager_Tree_Last_Updated__c, 'The employees Manager Tree Updated Time should not have been updated');
    //     // query application log
    //     List<Application_Log__c> appLogList = [SELECT Name FROM Application_Log__c];
    //     System.debug('****AppLogList is:'+appLogList);
    //     System.assertEquals(1, appLogList.size(), 'We expect only one log');
    //     // assert 1 was created
    // }
}