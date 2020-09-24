public with sharing class AddMultipleContactCLS {
    Public Account acc {get;set;}
	public AddMultipleContactCLS(ApexPages.StandardController std){
        acc = (Account)std.getRecord();        
		ConList = new List<ContactList>();
		addNewRowToConList();
    }
    public List<ContactList> ConList {get;set;}
	public class ContactList{
    	public Integer index {get;set;}
        public Contact record {get;set;}
    }
	public Integer rowToRemove {get;set;}
    public pagereference saveAccount(){
        insert acc;
        Pagereference pr = New PageReference('/' + acc.ID);
        return pr;
    }
    public pagereference cancel(){
		Pagereference pr = New PageReference('/apex/Test9Vf');
        pr.setRedirect(true);
        return pr;
    }
    public PageReference SaveMultipleContacts() {
	    system.debug('controller save method is calling-->');
    	saveContact(ConList, acc);
        Pagereference pr = New PageReference('/' + acc.ID);
        return pr;
    }
    public void saveContact(List<ContactList> ConList, Account acc) {
        saveAccount();
        system.debug('==ConList==>'+ConList.size());
        List<Contact> ContactRecordsToBeInserted = new List<Contact>();
        if(ConList !=null && !ConList.isEmpty()){
            for(ContactList eachRecord : ConList ){
                Contact accTemp = eachRecord.record;
                accTemp.AccountId=acc.Id;
                ContactRecordsToBeInserted.add(accTemp);
            }
        	system.debug('==ContactRecordsToBeInserted==>'+ContactRecordsToBeInserted.size());
        	insert ContactRecordsToBeInserted;
        }
    }	
	public void addNewRowToConList(){
    	ConList = addNewRowToConList(ConList);
    }
    public static List<ContactList> addNewRowToConList(List<ContactList> ConObjList){
        ContactList newRecord = new ContactList();
        Contact newContactRecord = new Contact();        
        newRecord.record = newContactRecord;
        newRecord.index = ConObjList.size();
        ConObjList.add(newRecord);
        return ConObjList;
    }
	public void removeRowFromConList(){
  		ConList = removeRowToContactList(rowToRemove, ConList);
	}
    public static List<ContactList> removeRowToContactList(Integer rowToRemove, List<ContactList> ContactList){
        ContactList.remove(rowToRemove);
        return ContactList;
    }

}