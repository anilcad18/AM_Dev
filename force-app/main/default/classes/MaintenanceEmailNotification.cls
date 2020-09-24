public class MaintenanceEmailNotification {
    public void sendMail(){
        //Send notification
        String s = system.Label.Maintenance_Notification_Receiver;
        System.debug(s);
        List<String> toaddress = new List<string>{s};    
        String subject='Maintenance Notification';
        String body = 'Hello Salesforce Team,';
        
        Messaging.SingleEmailMessage relEmail = new Messaging.SingleEmailMessage();                     
        relEmail.setToAddresses(toaddress);           
        relEmail.setSenderDisplayName(UserInfo.getName());       
        relEmail.setSubject(subject);                        
        relEmail.setHtmlBody(body); 
        
        Messaging.SendEmailResult[] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[]{relEmail});
    }
}