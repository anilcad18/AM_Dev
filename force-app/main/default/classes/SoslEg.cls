public with sharing class SoslEg {
	public void sslEg(){
	/*	list<AggregateResults> miCount = [select min(Count__c) minCount from Employee__c]
		
		for(AggregateResults mic : miCount){
			Integer cou = mic.get('miCount');
		}
		*/
		list<Employee__c> emp = [select Name,Name__c from Employee__c where Name__c='Anil'];    
		system.debug(emp);
		for(Employee__c emps : emp)
		{
			system.debug('Id : '+emps.Name+'          Name : '+emps.Name__c);
		}
	}
    	public void met1()
    {
    list<account> accList=new list<account>();
    list<contact> conList=new list<contact>();
    for(integer i=0;i<200;i++)
    {
        //system.debug('*********account adding'+i);
        account acc=new account();
        acc.name='Test Account'+i;
        accList.add(acc);
        
       //system.debug('*********account: '+acc);
    }
        insert accList;
        // system.debug('*******Inserting before***'+accList);
        for(integer j=0;j<200;j++)
        {
            contact con=new contact();
            con.LastName='Test Contact'+j;
            con.AccountId=accList[j].id;
            conList.add(con);
        }
        insert conList;
        system.debug('*****'+conList);
	}
}