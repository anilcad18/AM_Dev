global class RSSHandler implements Schedulable {

    global void execute(SchedulableContext c) {
        updateDeveloperBlog();
    }

    @future(callout=true)
    static global void updateDeveloperBlog() {
        List<Dom.XMLNode> recentPosts = RSSHandler.getRSSFeed('http://feeds.feedburner.com/developerforce/developerelations?format=xml');
        List<Blog_Entry__c> blogEntries = new List<Blog_Entry__c>();
        List<String> titles = new List<String>();
        List<Blog_Entry__c> entriesToAdd = new List<Blog_Entry__c>();

        String listOfBlogs = '';

        System.Debug('# OF POSTS FOUND:' +recentPosts.size());
    	for(Blog_Entry__c bp : blogEntries) {
            titles.add(bp.Title__c);
        }

        List<Blog_Entry__c> blogs = [SELECT Id, WordPress__c, Title__c, Author__c from Blog_Entry__c WHERE Title__c IN :titles];
        for(Blog_Entry__c blogEntry : blogEntries) {
            Boolean added = false;
            for(Blog_Entry__c blog : blogs) {
                if(blog.Title__c == blogEntry.Title__c) { added = true; }
            }
            if(!added) { entriesToAdd.add(blogEntry);  }
        }

        insert entriesToAdd;
        if(entriesToAdd.size() > 0) {
            for(Blog_Entry__c blogEntry : entriesToAdd) {
                listOfBlogs += '<BR/><a href="'+blogEntry.Link__c+'"><strong>'+blogEntry.Title__c+'</strong></a>,&nbsp;'+blogEntry.Author__c+''+ + '<BR />';
                listofBlogs += '<a href="http://twitter.com/?status='+EncodingUtil.urlEncode(blogEntry.Title__c +', '+blogEntry.Link__c, 'UTF-8')+'">Tweet This</a><BR /><HR />';
            }
            RSSHandler.sendEmailNotice(listOfBlogs);
            }
    }

    static global List<Dom.XMLNode> getRSSFeed(string URL) {
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        // url that returns the XML in the response body  

        req.setEndpoint(url);
        req.setMethod('GET');
        HttpResponse res = h.send(req);
        Dom.Document doc = res.getBodyDocument();

        Dom.XMLNode rss = doc.getRootElement();
        System.debug('@@' + rss.getName());

        List<Dom.XMLNode> rssList = new List<Dom.XMLNode>();
        for(Dom.XMLNode child : rss.getChildren()) {
           System.debug('@@@' + child.getName());
           for(Dom.XMLNode channel : child.getChildren()) {
               System.debug('@@@@' + channel.getName());

               if(channel.getName() == 'item') {
                    rssList.add(channel);
               }
           }
        }

        return rssList;

    }

    global static void sendEmailNotice(String links) {
		Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        //mail.setToAddresses(Label.blogemaillist.split(','));
        mail.toAddresses = new String[] {'ram.salesforce6@gmail.com'};
        mail.setSubject ('[BLOGLOG] New Entries');
        mail.setHTMLBody('<h3>New Blog Posts:</h3>'+links+'<br/><br/>');
		Messaging.SendEmailResult [] r = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
	}
}