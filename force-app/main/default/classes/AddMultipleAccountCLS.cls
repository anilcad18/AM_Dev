public with sharing class AddMultipleAccountCLS{
    public PageReference SaveMultipleAccounts(){
        system.debug('controller save method is calling-->');
         AddMultipleAccountHelperCLS1.save(waAccList);
        return null;
    }
	public List<WrapperpaAccountList> waAccList {get;set;}
    public Integer rowToRemove {get;set;}
    public AddMultipleAccountCLS(){
		waAccList = new List<WrapperpaAccountList>();
		addNewRowToAccList();
    }
	public void removeRowFromAccList(){
		waAccList = AddMultipleAccountHelperCLS1.removeRowToAccountList(rowToRemove, waAccList);
	}
	public void addNewRowToAccList(){
    	waAccList = AddMultipleAccountHelperCLS1.addNewRowToAccList(waAccList);
    }
	public class WrapperpaAccountList{
        public Integer index {get;set;}
        public Account record {get;set;}
    } 
}