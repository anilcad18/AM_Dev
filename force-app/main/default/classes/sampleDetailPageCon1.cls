public class sampleDetailPageCon1 {
    public List<Contact> cont;
    public Account acc; 
    public sampleDetailPageCon1(ApexPages.StandardController controller) {
        this.acc= (Account)controller.getRecord();
    }
    public List<Contact> getCont()
    {
        Account a = [Select id, Name FROM Account where id = :acc.id];
        if (a.Id == null)
         return null;
        cont = [Select id, Name, AccountId, Email, Phone, Fax from Contact where Contact.AccountId = :a.Id];
        return cont;
    }
}