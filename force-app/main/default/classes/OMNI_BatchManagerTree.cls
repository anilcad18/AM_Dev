/**
 * @description Batch Class to process Manager Tree.
 * @author      Anil Mannem
 * @date        13-Jan-2021                     
 */
global class OMNI_BatchManagerTree implements Database.Batchable<sObject>, Database.AllowsCallouts, Database.Stateful {

    public Map<String, String> managerMap;
    public Integer totalUserRecords = 0;
    public Integer processedRecords = 0;
    public Integer errorRecords = 0;
    public List<String> noSupervisorUsers = new List<String>();
    public List<String> infiniteLoopUsers = new List<String>();

    // global OMNI_BatchManagerTree(){
    //     managerMap = OMNI_ManagerTreeCallout.getManagerMap();
    // }
    global Database.QueryLocator start(Database.BatchableContext bc) {
        //managerMap = OMNI_ManagerTreeCallout.getManagerMap();
        String query = 'SELECT Id, Name, EmployeeID__c, Manager_Tree__c, Manager_Tree_Last_Updated__c FROM User WHERE EmployeeID__c != null AND IsActive = true Order By CreatedDate DESC'; 
        // if(managerMap == null){
        //     System.debug('***API returned NULL Map: '+managerMap);
        //     query +=  ' LIMIT 0'; // skip execute if there was an error in the API call
        // } else if (Test.isRunningTest()){
        //     query += ' LIMIT 10'; // limit execution to 1 batch for tests
        // }
        return Database.getQueryLocator(query);
    }

    global void execute(Database.BatchableContext bc, List<User> scope) {
        // for(User u : scope){
        //     System.debug('****User on entry is:'+u);
        //     totalUserRecords++;
        //     Boolean reachedTopLevel = false;
        //     Boolean employeeAppearsMoreThanOnceInTree = false;
        //     Boolean employeeNotFoundInManagerTreeResponse = false;
        //     String employee = u.EmployeeID__c;
        //     List<String> managerTreeEmployees = new List<String>();
        //     managerTreeEmployees.add(employee);

        //     do{
        //         employeeNotFoundInManagerTreeResponse = !managerMap.containsKey(employee);
        //         if(!employeeNotFoundInManagerTreeResponse){
        //             String employeesManager = managerMap.get(employee);
        //             reachedTopLevel = String.isBlank(employeesManager);
        //             if(!reachedTopLevel){
        //                 employeeAppearsMoreThanOnceInTree = managerTreeEmployees.contains(employeesManager);
        //                 managerTreeEmployees.add(employeesManager);
        //                 employee = employeesManager;
        //             } 
        //         } 
        //     }while(!reachedTopLevel && !employeeAppearsMoreThanOnceInTree && !employeeNotFoundInManagerTreeResponse);
            
        //     if(reachedTopLevel){
        //         u.Manager_Tree__c = ',' + String.join(managerTreeEmployees, ',') + ',';
        //         u.Manager_Tree_Last_Updated__c = Datetime.now();
        //         processedRecords++;
        //     } else if(employeeNotFoundInManagerTreeResponse){
        //         system.debug('***employeeNotFoundInManagerTreeResponse is: '+u.EmployeeID__c);
        //         noSupervisorUsers.add(u.EmployeeID__c);
        //         errorRecords++;
        //     } else if(employeeAppearsMoreThanOnceInTree){
        //         System.debug('***employeeAppearsMoreThanOnceInTree is: '+u.EmployeeID__c);
        //         infiniteLoopUsers.add(u.EmployeeID__c);
        //         errorRecords++;
        //     }
        //     System.debug('****User on exit is:'+u);
        // }
        // update scope;
    }

    global void finish(Database.BatchableContext bc){
        // String emailBody = generateEmailBody(); 
        // String subject = generateSubject();
        // List<String> recipients = generateRecipientsList();
        // generateAndSendEmail(recipients, subject, emailBody);
    }

    // private String generateEmailBody(){
    //     String emailBody = '';
    //     if(managerMap == null) {
    //         emailBody = 'There was an error retrieving the employee/manager mapping from the API. No users were updated.';
    //     } else {
    //         emailBody = 'Manager Tree Batch Job Report \n' +
    //             '\nTotal Active Users Queried from Salesforce: ' + totalUserRecords + '\n' +
    //             processedRecords + ' users were successfully updated.';
    //         if(errorRecords > 0) {
    //             emailBody = emailBody + '\n\nError Records: ' + errorRecords;
    //             if(infiniteLoopUsers.size() > 0){
    //                 emailBody = emailBody + '\n\n' + infiniteLoopUsers.size() + ' users have a Manager tree where a supervisor appears more than once so their Manager tree could not be updated.'+
    //                             '\nEmployee IDs are (max 10 shown):'+ infiniteLoopUsers.toString();
    //                 System.debug('Infinite loop users: ' + String.join(infiniteLoopUsers, ', '));
    //             }
    //             if(noSupervisorUsers.size() > 0){
    //                 emailBody = emailBody + '\n\n ' + noSupervisorUsers.size() + ' users have no corresponding employee ID or have a supervisor who has no corresponding employee ID so their Manager tree could not be updated.'+
    //                     '\nEmployee IDs are (max 10 shown):'+ noSupervisorUsers.toString();
    //                 System.debug('Not found in payload users: ' + String.join(noSupervisorUsers, ', '));
    //             }
    //         }           
    //     }
    //     System.debug('****EmailBody: '+emailBody);
    //     return emailBody;
    // }

    // private String generateSubject(){
    //     String subject = 'Manager Tree Update';
    //     if(managerMap == null){
    //         subject += ' - API error';
    //     } else if(errorRecords > 0){
    //         subject += ' - Some errors occured';
    //     } else {
    //         subject += ' Successful';
    //     }
    //     return subject;
    // }

    // private List<String> generateRecipientsList(){
    //     List<String> userOrGroupIdList = new List<String>();
    //     List<String> emailAddressesList = new List<String>();
    //     Group grp = [SELECT (SELECT UserOrGroupId FROM GroupMembers) FROM Group WHERE NAME = 'Admin - Exception Email Group' LIMIT 1];
    //     for (GroupMember gm : grp.GroupMembers) {
    //         userOrGroupIdList.add(gm.UserOrGroupId);
    //     }
    //     List<User> userList = [SELECT Email FROM User WHERE Id IN :userOrGroupIdList];
    //     for(User u : userList) {
    //         emailAddressesList.add(u.email);
    //     }
    //     return emailAddressesList;
    // }

    // public void generateAndSendEmail(List<String> recipients, String subject, String emailBody){
    //     List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
    //     Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    //     mail.setToAddresses(recipients);
    //     mail.setSenderDisplayName('Intact Support');
    //     mail.setSubject(subject);
    //     mail.setPlainTextBody(emailBody);
    //     mails.add(mail);
    //     Messaging.sendEmail(mails);
    // }
}