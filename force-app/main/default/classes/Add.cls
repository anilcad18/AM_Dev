public class Add {
    public void add(){
      /*  Integer i,j;
        String a=' ';
        String b='Anil';
        i=10;
        j=20;
        j +=i;
        System.debug('Sum is :' +j);
        String c = 'c ';
        c += !string.isEmpty(a)?a+' 1 ':'';
        c += !string.isEmpty(b)?b+' 1 ':'';
        system.debug(c);
*/
        Book__c b = new Book__c();
        DateTime d = DateTime.now();
		//system.debug(d.date());
        //system.debug(d.time());
       // DateTime dt = DateTime.newInstanceGMT(d.date(), d.Time());
       // system.debug(dt);
        String dat = d.format('yyyy-MM-dd HH:mm:ss','GMT');
        Datetime myDate = Datetime.valueOf(dat);
        b.Date__c = myDate;
        insert b;

        system.debug('GMT Time Now*******' +dat);
    }
}