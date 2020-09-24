/**
 * Created by Anil Mannem on 03-Aug-2020
 */
public class icUSSalesGeneratePDF_Email {
    
    static icLogicBidder.IClass logicBidder = (icLogicBidder.IClass) icObjectFactory.GetSingletonInstance('icLogicBidder');
    //static icLogicAttachment.IClass logicAttachment = (icLogicAttachment.IClass) icObjectFactory.GetSingletonInstance('icLogicAttachment');
    //static icLogicEmail.IClass logicEmail = (icLogicEmail.IClass) icObjectFactory.GetSingletonInstance('icLogicEmail');

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

       //     logicAttachment.createDocumentInObject(recordId, fileTitle, fileTitle, p.getContentAsPDF());
                    
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
      //      logicEmail.sendPlainTextEmail(subject, body, recipients, ccRecipients, bccRecipients, entities, attachments);
        } else {
            errorMessage = 'Opportunity has to be Approved to Generate PDF';
        }
        return errorMessage;
    }
}