/**
 * @description       : 
 * @author            : Anil Mannem
 * @last modified on  : 04-04-2021
 * @last modified by  : Anil Mannem
 * Modifications Log 
 * Ver   Date         Author        Modification
 * 1.0   04-04-2021   Anil Mannem   Initial Version
**/
public class AccClassTrigger {
    public static boolean runOnce = true;
    /**
    * @description 
    * @author Anil Mannem | 04-04-2021 
    **/
    public AccClassTrigger(){
        system.debug('The size is '+trigger.size+' ****** Runonce '+runOnce);
        //runOnce = true;
        system.debug('The size is '+trigger.size+' ****** Runonce in Constructor'+runOnce);
    }
    /**
    * @description 
    * @author Anil Mannem | 04-04-2021 
    * @param List<Account> newAcc 
    **/
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