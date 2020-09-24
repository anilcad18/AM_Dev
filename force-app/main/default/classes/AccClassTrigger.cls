public class AccClassTrigger {
    public static boolean runOnce = true;
    public AccClassTrigger(){
        system.debug('The size is '+trigger.size+' ****** Runonce '+runOnce);
        //runOnce = true;
        system.debug('The size is '+trigger.size+' ****** Runonce in Constructor'+runOnce);
    }
    public void onAfterInsert(List<Account> newAcc){
  		List<Account> accRev = new List<Account>();
	    List<Contact> conlist = new List<Contact>();
        if(runOnce){
            runOnce = False;
            for(Account acc: newAcc){
                Account a = new Account();
           	    a.Name = acc.name+' Reverse';
          	    accRev.add(a);
 				/*Contact con= new Contact();
           		con.LastName = acc.name;
           		con.AccountId = acc.Id;
           		conlist.add(con);
           		system.debug(con);*/
            }
        }
        for(Account acc: newAcc){
           Contact con= new Contact();
           con.LastName = acc.name;
           con.AccountId = acc.Id;
           conlist.add(con);
           system.debug(con);
        }
        system.debug('Runonce value before Insert'+runOnce);
        insert accRev;
        system.debug('Runonce value After Insert'+runOnce);
        insert conList;
    }
}