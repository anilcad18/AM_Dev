public class  icUSSalesQuotePDFController {
    public Bidder__c bidder {get;set;}
    public List<OpportunityLineItem> opportunityLineItemList {get;set;}
    
    public icUSSalesQuotePDFController(ApexPages.StandardController controller){
        system.debug('****1 Entered Constructor');
        String bidderID = ApexPages.currentPage().getParameters().get('bidderID');
        List<Bidder__c> bidderList = [SELECT Id, 
                                            Name,
                                            Distributor_Account__r.Name,
                                            Contractor_Account__r.Name,
                                            Opportunity__r.Name,
                                            Opportunity__c, 
                                      		Opportunity__r.Quote_Approved__c,
                                            Opportunity__r.Account.BillingAddress,
                                            Opportunity__r.Account.BillingStreet,
                                      		Opportunity__r.Account.BillingCity
                                        FROM Bidder__c
                                        WHERE Id =: bidderID];
        if(!bidderList.isEmpty()) {
            bidder = bidderList[0];
            opportunityLineItemList = [SELECT Product2.Name,
                                                Quantity,
                                                UnitPrice,
                                                Subtotal,
                                                ListPrice,
                                                TotalPrice
                                        FROM OpportunityLineItem
                                        WHERE Opportunity.Id =: bidder.Opportunity__c];
        }
    }
	
    public static void attachPDFABC() {
        String bidderId = ApexPages.currentPage().getParameters().get('bidderId');
        PageReference p = Page.US_Sales_Quote_PDF;
        p.getParameters().put('bidderID', bidderId);
        /*Attachment attach = new Attachment();
        attach.Body = p.getContentAsPDF();
        attach.Name = 'ABC.pdf';
        attach.ParentId = bidderId;
        insert attach;
        return new PageReference('/servlet/servlet.FileDownload?file=' + attach.Id);
		*/
        ContentVersion content2 = new ContentVersion();
        content2.versionData = test.isRunningTest() ? Blob.valueOf(''):p.getContentAsPDF();
        content2.title= 'Confirmation of NJSave Application.pdf';
        content2.PathOnClient= 'Confirmation of NJSave Application.pdf';
        content2.IsMajorVersion = true;
        insert content2;
        ContentDocument RelatedContentDocument = [SELECT Id,LatestPublishedVersionId FROM ContentDocument WHERE LatestPublishedVersionId =:content2.ID limit 1];
        ContentDocumentLink cdl = New ContentDocumentLink(); 
        cdl.LinkedEntityId = bidderId; 
        cdl.ContentDocumentId = RelatedContentDocument.ID;
        cdl.shareType = 'V'; 
        cdl.Visibility = 'AllUsers'; 
        insert cdl;
        
        //return new PageReference('/servlet/servlet.FileDownload?file=' + content2.Id);
    }
    
    @AuraEnabled
    public static void attachPDFABCAura(Id recId) {
        String bidderId = recId;
        List<Bidder__c> bidderList = [SELECT Name from Bidder__c WHERE Id =: recId];
        Bidder__c bidder;
        if(!bidderList.isEmpty()) {
            bidder = bidderList[0];
        }
        System.debug('**** The record id form aura: ' + recId);
        PageReference p = Page.US_Sales_Quote_PDF;
        p.getParameters().put('bidderID', bidderId);
        /*Attachment attach = new Attachment();
        attach.Body = p.getContentAsPDF();
        attach.Name = thisBidder.Name+'.pdf';
        attach.ParentId = bidderId;
        insert attach;
		*/
        ContentVersion content2 = new ContentVersion();
        content2.versionData = test.isRunningTest() ? Blob.valueOf(''):p.getContentAsPDF();
        content2.title= bidder.Name+'.pdf';
        content2.PathOnClient= bidder.Name+'.pdf';
        content2.IsMajorVersion = true;
        insert content2;
        ContentDocument RelatedContentDocument = [SELECT Id,LatestPublishedVersionId FROM ContentDocument WHERE LatestPublishedVersionId =:content2.ID limit 1];
        ContentDocumentLink cdl = New ContentDocumentLink(); 
        cdl.LinkedEntityId = bidderId; 
        cdl.ContentDocumentId = RelatedContentDocument.ID;
        cdl.shareType = 'V'; 
        cdl.Visibility = 'AllUsers'; 
        insert cdl;
        
        
        Messaging.EmailFileAttachment emailAttach = new Messaging.EmailFileAttachment();
    	emailAttach.setContentType('application/pdf');
    	emailAttach.setFileName(bidder.Name + '.pdf');
    	emailAttach.setInline(false);
    	emailAttach.Body = p.getContentAsPDF();
		
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    	mail.setUseSignature(false);
    	mail.setToAddresses(new String[] {'anilmannem18@gmail.com'});
        mail.setReplyTo('anilmannem18@gmail.com');
        mail.setSenderDisplayName('displayName');

    	/*mail.setSubject('Invoice for ' + empName + ' ' + invStartDate + ' TO '+ invEndDate);
    	mail.setHtmlBody('Hi Finance Team,<br/>Below are the contacts of <b>' + empName + '</b> vendor:<br/>'
                         + '<br/><b>Finance Primary:</b><br/>' + financePrimary
                         + '<br/><br/><b>Finance Secondary:</b><br/>' + financeSecondary
                         + '<br/><br/><b>HR Primary:</b><br/>' + hrEmails
                         + '<br/><br/><b>Recruiter Secondary:</b><br/>' + recEmails
                         + '<br/><br/><b>President Secondary:</b><br/>' + presEmails);
		*/
        mail.setSubject('Welcome Attachment');
    	mail.setHtmlBody('Welcome body');
    	mail.setFileAttachments(new Messaging.EmailFileAttachment[] { emailAttach }); 
		system.debug('************** The email:\n'+  mail);
        // Send the email
        if(!test.isRunningTest())
    		Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
		//ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Email with PDF sent to drazon1818@gmail.com'));
		//system.debug('Leaving from sendMail() of ' + InvoiceExtCnt.class);
        //return null;
    }
    
	@AuraEnabled
    public static void attachPDFABCAura1(Id recId) {
        String bidderId = recId;
        List<Bidder__c> bidderList = [SELECT Name from Bidder__c WHERE Id =: recId];
        Bidder__c bidder;
        if(!bidderList.isEmpty()) {
            bidder = bidderList[0];
        }
        System.debug('**** The record id form aura: ' + recId);
        PageReference p = Page.US_Sales_Quote_PDF;
        p.getParameters().put('bidderID', bidderId);
        /*Attachment attach = new Attachment();
        attach.Body = p.getContentAsPDF();
        attach.Name = thisBidder.Name+'.pdf';
        attach.ParentId = bidderId;
        insert attach;
		*/
        ContentVersion content2 = new ContentVersion();
        content2.versionData = test.isRunningTest() ? Blob.valueOf(''):p.getContentAsPDF();
        content2.title= bidder.Name+'.pdf';
        content2.PathOnClient= bidder.Name+'.pdf';
        content2.IsMajorVersion = true;
        insert content2;
        ContentDocument RelatedContentDocument = [SELECT Id,LatestPublishedVersionId FROM ContentDocument WHERE LatestPublishedVersionId =:content2.ID limit 1];
        ContentDocumentLink cdl = New ContentDocumentLink(); 
        cdl.LinkedEntityId = bidderId; 
        cdl.ContentDocumentId = RelatedContentDocument.ID;
        cdl.shareType = 'V'; 
        cdl.Visibility = 'AllUsers'; 
        insert cdl;
        
        
        Messaging.EmailFileAttachment emailAttach = new Messaging.EmailFileAttachment();
    	emailAttach.setContentType('application/pdf');
    	emailAttach.setFileName(bidder.Name + '.pdf');
    	emailAttach.setInline(false);
    	emailAttach.Body = p.getContentAsPDF();
		
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    	mail.setUseSignature(false);
    	mail.setToAddresses(new String[] {'anilmannem18@gmail.com'});
        mail.setReplyTo('anilmannem18@gmail.com');
        mail.setSenderDisplayName('displayName');

    	/*mail.setSubject('Invoice for ' + empName + ' ' + invStartDate + ' TO '+ invEndDate);
    	mail.setHtmlBody('Hi Finance Team,<br/>Below are the contacts of <b>' + empName + '</b> vendor:<br/>'
                         + '<br/><b>Finance Primary:</b><br/>' + financePrimary
                         + '<br/><br/><b>Finance Secondary:</b><br/>' + financeSecondary
                         + '<br/><br/><b>HR Primary:</b><br/>' + hrEmails
                         + '<br/><br/><b>Recruiter Secondary:</b><br/>' + recEmails
                         + '<br/><br/><b>President Secondary:</b><br/>' + presEmails);
		*/
        mail.setSubject('Welcome Attachment');
    	mail.setHtmlBody('Welcome body');
    	mail.setFileAttachments(new Messaging.EmailFileAttachment[] { emailAttach }); 
		system.debug('************** The email:\n'+  mail);
        // Send the email
        if(!test.isRunningTest())
    		Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
		//ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO, 'Email with PDF sent to drazon1818@gmail.com'));
		//system.debug('Leaving from sendMail() of ' + InvoiceExtCnt.class);
        //return null;
    }

}


/**
 * Created by Anil Mannem (Incloud) on 03-Aug-2020
 *
public class  icUSSalesQuotePDFController {
    public Boolean isDisplay {get;set;}
    public Bidder__c bidder {get;set;}
    public List<OpportunityLineItem> opportunityLineItemList {get;set;}

    icLogicBidder.IClass logicBidder = (icLogicBidder.IClass) icObjectFactory.GetSingletonInstance('icLogicBidder');
    icLogicOpportunityLineItems.IClass logicOpportunityLineItems = (icLogicOpportunityLineItems.IClass) icObjectFactory.GetSingletonInstance('icLogicOpportunityLineItems');
    
    public icUSSalesQuotePDFController(ApexPages.StandardController controller){
        String bidderID = ApexPages.currentPage().getParameters().get('bidderID');
        List<Bidder__c> bidderList = logicBidder.getBidderDetailsforPDF(bidderID);
        if(!bidderList.isEmpty()) {
            bidder = bidderList[0];
            String fileTitle = bidder.Opportunity__r.Name+' - '+bidder.Distributor_Account__r.Name+' - '+bidder.Contractor_Account__r.Name+' - Quote.pdf';
            Apexpages.currentPage().getHeaders().put('content-disposition', 'inline; filename='+fileTitle);
            opportunityLineItemList = logicOpportunityLineItems.getProductsForOpportunity(bidder.Opportunity__c);
        }
    }
}




/**
 * Created by Anil Mannem on 03-Aug-2020
 *
public class icUSSalesGeneratePDF_Email {
    
    static icLogicBidder.IClass logicBidder = (icLogicBidder.IClass) icObjectFactory.GetSingletonInstance('icLogicBidder');
    static icLogicAttachment.IClass logicAttachment = (icLogicAttachment.IClass) icObjectFactory.GetSingletonInstance('icLogicAttachment');
    static icLogicEmail.IClass logicEmail = (icLogicEmail.IClass) icObjectFactory.GetSingletonInstance('icLogicEmail');

    @AuraEnabled
    public static String generatePDFandEmail(String recordId) {
        String errorMessage = '';
        List<Bidder__c> bidderList = logicBidder.getBidderDetailsforPDF(recordId);
        Bidder__c bidder;
        if(!bidderList.isEmpty()) {
            bidder = bidderList[0];
        }
        if (bidder.Opportunity__r.Quote_Approved__c) {
            PageReference p = Page.US_Sales_Quote_PDF;
            p.getParameters().put('bidderID', recordId);

            String fileTitle = bidder.Opportunity__r.Name+' - '+bidder.Distributor_Account__r.Name+' - '+bidder.Contractor_Account__r.Name+' - Quote.pdf';

            logicAttachment.createDocumentInObject(recordId, fileTitle, fileTitle, p.getContentAsPDF());
                    
            Messaging.EmailFileAttachment emailAttach = new Messaging.EmailFileAttachment();
            emailAttach.setContentType('application/pdf');
            emailAttach.setFileName(fileTitle);
            emailAttach.setInline(false);
            emailAttach.Body = p.getContentAsPDF();
            
            String subject = 'US Sales Quote of '+bidder.Opportunity__r.Name+' - '+bidder.Distributor_Account__r.Name+' - '+bidder.Contractor_Account__r.Name+' pair';
            String body = 'Hi '+ '<name>'+'\n'+
                        'Thank you for the opportunity to quote the '+' <project name> '+' project you’re working on. '+
                        'I have gotten the pricing quote over to '+'<supplier name>'+', so they should be getting the '+
                        'pricing to you shortly.  Hopefully all our benefits will greatly help you on this one to increase '+
                        'your profits and deliver a solid product.  Based on the <total square size> squares, looks like we '+
                        'will save you '+'<squares saved from below data> '+'squares on this project due to our full square '+
                        'coverage, and that will be labor saved as well.  Also with our bigger sized shingles, that will be '+
                        '<# of shingles> '+'fewer shingles installed - so quicker production speed should help get you on to '+
                        'the next job quicker.  <provide additional short comments here if desired>.  I’ve listed out the'+
                        ' estimated stats below as well.';

            List<String> recipients = new List<String>{bidder.Owner.Email}; //Email of Sales Rep who creates the bidder record.
            List<String> ccRecipients = new List<String>();
            List<String> bccRecipients = new List<String>();
            List<String> entities = new List<String>();
            List<Messaging.EmailFileAttachment> attachments = new List<Messaging.EmailFileAttachment>();
            attachments.add(emailAttach);

            // EmailTemplate template = logicEmail.getEmailTemplateByDevName('US_Sales_FollowUp_Quote');
            // logicEmail.sendTemplateEmail(template, bidder.Owner, bidder.Opportunity__c, entities, attachments);
            // logicEmail.sendTemplateEmail(template, '0053600000944h4AAA', bidder.Opportunity__c, entities, attachments);
            logicEmail.sendPlainTextEmail(subject, body, recipients, ccRecipients, bccRecipients, entities, attachments);
        } else {
            errorMessage = 'Opportunity has to be Approved to Generate PDF';
        }
        return errorMessage;
    }
}*/