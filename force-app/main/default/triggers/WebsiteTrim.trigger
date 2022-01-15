trigger WebsiteTrim on Account (before insert, before update) {
    for(Account c : Trigger.new){
        c.Site = c.Site.replaceAll('www.', '');
        c.Site = c.Site.replaceAll('http://', '');
        c.Website = c.Website.replaceAll('https://', '');
    }

}