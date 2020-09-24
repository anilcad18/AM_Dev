public class RandomContactFactory {
    public static list<Contact> generateRandomContacts(integer n, string ln){
        List<Contact> c = new List<Contact>();
        for(integer i=0;i<n; i++){
            ln = 'Test'+i;
            Contact c1=new Contact(FirstName=ln, LastName=ln);
            c.add(c1);
        }
        return c;
    }
}