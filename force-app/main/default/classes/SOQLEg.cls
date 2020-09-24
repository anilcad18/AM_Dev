public class SOQLEg {
    public void ins(){
    	list<Account> accts = new List<Account>();
        list<Contact> cont = new List<Contact>();
    	//Map<ID, Contact> insMap= new Map<ID, Contact>(); 
	        for(Integer i=1;i<=200;i++){
	    		Account a = new Account(Name='C '+i);
	    		accts.add(a);      /* If record was added using this statement id was not created and unable to create child for it instantly   */
	    		system.debug('Inserted data in Account');
            }
        	insert accts;
       	 Integer j=1;
        	for(Account acc: accts){
            	    Contact con = new Contact(FirstName='Ram '+j, LastName='Salesforce Batch '+j, AccountID=acc.ID);
                    cont.add(con);
                    system.debug('Inserted data in Contacts');
	    			j++;
            }
            insert cont;
    }	

//Updating a particular record value
    public void updateAcc(){	
    	Account accToUpdate =[select BillingCity from Account where  Name='Ram'];
    	accToUpdate.BillingCity= 'Hyd';
    	update accToUpdate;
    	system.debug('Updated data');
    }
//Inserting records into Account Object at once
    public void insAcc(){
    	list<Account> accts = new List<Account>();
        for(Integer i=1;i<=210;i++){
	    	Account a = new Account(Name='C '+i);
	    	accts.add(a);
        }
        insert accts;
    }
//Inserting records into Contact Object at once    
    public void insCon(){
    	list<Contact> cons = new List<Contact>();
        for(Integer i=1;i<=200;i++){
	    	Contact con = new Contact(FirstName='Ram '+i, LastName='SalesforceBatch '+i);
	    	cons.add(con);
	    	system.debug('Inserted data in Contacts');
	    }
        insert cons;
    }
//Deleting  data
    public void delAcc(){
       List<Account> a = [select Id,Name from Account where Name Like 'R%' ];
       system.debug('Record was '+a);
       delete a;
    }
    public void delCon(){
       List<Contact> c = [select Id,Name from Contact where LastName Like 'q%' ];
       system.debug('Record was '+c);
       delete c;
    }
}