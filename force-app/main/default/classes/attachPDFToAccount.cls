public class attachPDFToAccount {
	
	private final Account a; //Account object
	
	//constructor
	public attachPDFToAccount(ApexPages.StandardController controller) {
		a = (Account)controller.getRecord(); //instantiate the Account object for the current record
	}
	
	//method called from the Visualforce's action attribute
	public PageReference attachPDF() {
		
		//generate and attach the PDF document
		PageReference pdfPage = Page.pdfDemo; //create a page reference to our pdfDemo Visualforce page, which was created from the post https://interactiveties.com/blog/2015/render-visualforce-pdf.php
		Blob pdfBlob; //create a blob for the PDF content
		if (!Test.isRunningTest()) { //if we are not in testing context
			pdfBlob = pdfPage.getContent(); //generate the pdf blob
		} else { //otherwise, we are in testing context and getContent() gets funky so create the blob manually
			pdfBlob = Blob.valueOf('Some Text for a boring PDF file...');
		}
		Attachment attach = new Attachment(parentId = a.Id, Name = 'pdfAttachmentDemo.pdf', body = pdfBlob); //create the attachment object
		insert attach;
        ContentVersion content2 = new ContentVersion();
        content2.versionData = pdfPage.getContent();
        content2.title= 'Sample.pdf';
        content2.PathOnClient= 'Sample.pdf';
        content2.IsMajorVersion = true;
        insert content2;
        ContentDocument RelatedContentDocument = [SELECT Id,LatestPublishedVersionId FROM ContentDocument WHERE LatestPublishedVersionId =:content2.ID limit 1];
        ContentDocumentLink cdl = New ContentDocumentLink(); 
        cdl.LinkedEntityId = a.Id; 
        cdl.ContentDocumentId = RelatedContentDocument.ID;
        cdl.shareType = 'I'; 
        insert cdl;
		//redirect the user
		PageReference pageWhereWeWantToGo = new ApexPages.StandardController(a).view(); //we want to redirect the User back to the Account detail page
		pageWhereWeWantToGo.setRedirect(true); //indicate that the redirect should be performed on the client side
		return pageWhereWeWantToGo; //send the User on their way
	}

}