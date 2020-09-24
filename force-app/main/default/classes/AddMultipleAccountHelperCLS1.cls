public class AddMultipleAccountHelperCLS1 {
    public static List<AddMultipleAccountCLS.WrapperpaAccountList> addNewRowToAccList(List<AddMultipleAccountCLS.WrapperpaAccountList> waAccObjList){
        AddMultipleAccountCLS.WrapperpaAccountList newRecord = new AddMultipleAccountCLS.WrapperpaAccountList();
        Account newAccountRecord = new Account();        
        newRecord.record = newAccountRecord;
        newRecord.index = waAccObjList.size();
        waAccObjList.add(newRecord);
        return waAccObjList;
    }
     public static List<AddMultipleAccountCLS.WrapperpaAccountList> removeRowToAccountList(Integer rowToRemove, List<AddMultipleAccountCLS.WrapperpaAccountList> waAccountList){
        waAccountList.remove(rowToRemove);
        return waAccountList;
    }
    public static void save(List<AddMultipleAccountCLS.WrapperpaAccountList> waAccList) {
        system.debug('==waAccList==>'+waAccList.size());
        List<Account> accountRecordsToBeInserted = new List<Account>();
        if(waAccList !=null && !waAccList.isEmpty()){
            for(AddMultipleAccountCLS.WrapperpaAccountList eachRecord : waAccList ){
                Account accTemp = eachRecord.record;
                accountRecordsToBeInserted.add(accTemp);
            }
            system.debug('==accountRecordsToBeInserted==>'+accountRecordsToBeInserted.size());
            insert accountRecordsToBeInserted;
        }
    }
}